class HomeController < ApplicationController
  def index
    @req = request
    @bro = browser
    respond_to :html
  end

  def settings
    asd
  end

  def error
    respond_to :html
  end
end