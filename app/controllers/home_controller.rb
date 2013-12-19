class HomeController < ApplicationController
  def index
    @req = request
    @bro = browser
    respond_to :html
  end

  def error
    respond_to :html
  end
end