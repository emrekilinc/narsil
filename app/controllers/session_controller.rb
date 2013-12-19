class SessionController < ApplicationController
  layout false
  
  def login
    respond_to :html
  end
end