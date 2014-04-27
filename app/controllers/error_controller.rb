class ErrorController < ApplicationController
  ## GET : '/errors'
  def index
    @errors = Error.order("occured_at DESC").paginate(:page => params[:page], :per_page => 100)
    respond_to :html
  end

  ## GET : '/error/:id'
  def show
    @error = Error.find(params[:id])
    respond_to :html
  end
end