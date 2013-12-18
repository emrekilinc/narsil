class Project < ActiveRecord::Base
  
  def error_count
    Error.where(code: self.code).count
  end
end