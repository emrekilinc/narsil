module Authentication
  extend ActiveSupport::Concern

  included do
    attr_accessor :password

    validates :username, presence: true, uniqueness: true, length: { maximum: 70 }
    validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

    validates_presence_of :password, on: :create
    validates_length_of :password, within: 4..40, allow_blank: true

    before_save :downcase_email
    before_save :encrypt_password, unless: "password.blank?"
    before_create { generate_token(:remember_token) }
  end

  def reset_remember_token
    generate_token(:remember_token)
  end

  def reset_remember_token_and_save
    reset_remember_token
    save(validate: false)
  end

  def reset_password_token
    self.password_reset_token = nil
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!

    # TODO : Send mail here with delayed job
  end

  def track_on_login(request)
    UserLogin.create({
      logged_in_at: Time.zone.now,
      ip: request.remote_ip,
      user_id: self.id
    })
  end

  def track_on_logout
    self.last_logout_at = Time.zone.now
  end

  def is_administrator?
    self.membership_type == "ADMINISTRATOR"
  end

  def logout(cookies)
    track_on_logout
    reset_remember_token_and_save
    cookies.delete(:remember_token)
  end

  private

  def encrypt_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def downcase_email
    email.downcase! if email.present?
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  module ClassMethods

    def authenticate(login, pass)    
      regex = Regexp.new(/\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/)
      query = "username = ? and is_closed = false"

      if regex.match(login)
        query = "email = ? and is_closed = false"
      end

      user = where(query, login.downcase).first
      return user if user && user.password_hash == BCrypt::Engine.hash_secret(pass, user.password_salt)
    end

    def valid_token?(column, token)
      User.exists?(column => token)
    end

  end
end