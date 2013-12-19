module Api
  module V1
    class ErrorsController < ApplicationController
      skip_before_filter :login_required
      skip_after_filter :save_current_user_if_dirty, :update_last_activity_at
      before_filter :restrict_access
      respond_to :json

      def index
        respond_with Error.all
      end

      private
      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end

    end
  end
end