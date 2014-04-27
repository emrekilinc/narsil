class Project < ActiveRecord::Base
  validates_presence_of :name, :primary_color, :code
  
  def error_count
    Error.where(project_code: self.code).count
  end
end