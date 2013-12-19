module Api
  module V1
    class ErrorsController < ApplicationController
      skip_before_filter :login_required
      skip_before_action :verify_authenticity_token
      skip_after_filter :save_current_user_if_dirty, :update_last_activity_at
      before_filter :restrict_access
      respond_to :json

      def create
        result = nil
        create_params = {
          project_code: params[:project_code],
          message: params[:message],
          url: params[:url],
          where: params[:where],
          occured_at: params[:occured_at],
          browser: params[:browser],
          ip: params[:ip],
          backtrace: params[:backtrace],
          backtrace: params[:backtrace],
          browser: params[:name],
          format: params[:format],
          method: params[:method],
          headers: params[:headers],
          port: params[:port],
          protocol: params[:protocol],
          version: params[:version],
          platform: params[:platform],
          bot: params[:bot?],
          is_modern: params[:modern?],
          browser_meta: params[:user_agent]
        }
        error = Error.create(create_params)

        if error.valid?
          result = error.create_output
        else
          result = error.validation_output
        end

        render json: result
      end

      private
      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end

      def check_params
      end

    end
  end
end