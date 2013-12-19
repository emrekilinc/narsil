require 'helpers/narsil_wrapper'

class ApplicationController < ActionController::Base
  PROJECT_CODE = "SAMPLE_PROJECT_CODE"

  protect_from_forgery with: :exception
  after_filter :save_current_user_if_dirty, :update_last_activity_at
  before_filter :login_required
  helper_method :current_user
  helper_method :logged_in?
  
  rescue_from StandardError do |e|
    create_params = {
      project_code: PROJECT_CODE,
      message: e.message,
      occured_at: Time.zone.now,
      where: e.class,
      backtrace: e.backtrace.join("\n"),
      url: request.url,
      ip: request.remote_ip,
      browser: browser.name
    }
    NarsilWrapper.log(create_params)
    redirect_to error_url

    # request.format - The content type requested by the client.
    # request.method - The HTTP method used for the request.
    # request.headers - Returns a hash containing the headers associated with the request.
    # request.port - The port number (integer) used for the request.
    # request.protocol - Returns a string containing the protocol used plus "://", for example "http://".

    # browser.version
    # browser.platform
    # browser.bot?
    # browser.meta or browser.to_s - an array with several attributes
    # browser.modern?
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token]) if cookies[:remember_token].present?
  end

  def logged_in?
    current_user
  end

  def login_required
    unless logged_in?
      redirect_to login_url, alert: "You must login to continue!"
    end
  end

  def authorize(type)
    if type.nil?
      redirect_to login_url if current_user.nil?
    else
      redirect_to login_url if current_user.nil? || current_user.membership_type != type
    end
  end

  def check_current_user
    redirect_to root_url if logged_in?
  end

  def update_last_activity_at
    current_user.last_activity_at = Time.zone.now if current_user
  end

  def save_current_user_if_dirty
    current_user.save!(validate: false) if current_user && current_user.changed?
  end
end
