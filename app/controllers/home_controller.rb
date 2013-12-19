class HomeController < ApplicationController
  def index
    respond_to :html
  end

  def error
    respond_to :html
  end
end