# https://en.gravatar.com/site/implement/images/
class GravatarHelper
  def self.generate(email, size)
    hash = Digest::MD5.hexdigest(email.downcase)
    d = "mm"
    "http://www.gravatar.com/avatar/#{hash}?" + {
      s: size,
      d: d
    }.to_query
  end
end