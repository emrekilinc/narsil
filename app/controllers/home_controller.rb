class HomeController < ApplicationController
  def index
    asd
    respond_to :html
  end

  def settings
  end

  def error
    respond_to :html
  end
end