require 'helpers/string_helper'
require 'helpers/gravatar_helper'

class User < ActiveRecord::Base
  include Authentication

  has_many :users

  def display_name
    if full_name.strip == "" || full_name.nil?
      return username
    else
      return full_name
    end
  end

end
