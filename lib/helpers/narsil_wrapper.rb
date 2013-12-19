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
      "backtrace" => create_params[:backtrace]
    })

    response = http.request(request)
  end
end