module Api
  module V1
    class ErrorsController < ApplicationController
      respond_to :json

      def index
        respond_with Error.all
      end

      def show
        respond_with Error.find(params[:id])
      end

      def create
        respond_with Error.create(params[:error])
      end

      def update
        respond_with Error.update(params[:id], params[:error])
      end

      def destroy
        respond_with Error.destroy(params[:id])
      end

    end
  end
end