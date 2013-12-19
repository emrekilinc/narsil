require 'net/http'
require 'uri'

class NarsilWrapper
  ACCESS_TOKEN = "c55112c8a981bbf118649a7a8a700e71"

  def self.log(create_params)
    uri = URI.parse("http://dashboard.2nworks.com/api/error")
    http = Net::HTTP.new(uri.host, uri.port)
    token = ActionController::HttpAuthentication::Token.encode_credentials(ACCESS_TOKEN)
    
    request = Net::HTTP::Post.new(uri.request_uri)
    request["Authorization"] = token

    request.set_form_data({
      "project_code" => create_params[:project_code],
      "message" => create_params[:message],
      "url" => create_params[:url],
      "where" => create_params[:where],
      "occured_at" => create_params[:occured_at],
      "browser" => create_params[:browser],
      "ip" => create_params[:ip],
      "backtrace" => create_params[:backtrace],
      "browser" => create_params[:browser],
      "format" => create_params[:format],
      "method" => create_params[:method],
      "headers" => create_params[:headers],
      "port" => create_params[:port],
      "protocol" => create_params[:protocol],
      "version" => create_params[:version],
      "platform" => create_params[:platform],
      "bot" => create_params[:bot],
      "is_modern" => create_params[:is_modern],
      "browser_meta" => create_params[:browser_meta]
    })

    response = http.request(request)
  end
end