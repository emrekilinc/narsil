class SessionController < ApplicationController
  layout false
  skip_before_filter :login_required, except: [:logout]
  
  def login
    check_current_user
    respond_to :html
  end

  def authenticate
    @current_user = User.authenticate(params[:username], params[:password])
    
    if @current_user
      @current_user.track_on_login(request)

      cookies[:remember_token] = { value: @current_user.remember_token, expires: 24.weeks.from_now }
      redirect_to root_url
    else
      flash[:error] = "Username or password is wrong!"
      redirect_to login_url
    end
  end
end