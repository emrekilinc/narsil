class Error < ActiveRecord::Base
  validates_presence_of :project_code
  validates_presence_of :message
  validates_presence_of :occured_at

  def project_name
    Project.find_by_code(self.project_code).name
  end

  def create_output
    Jbuilder.encode do |json|
      json.status 200
      json.error do
        json.(self, :project_code, :message, :url, :occured_at, :browser, :ip, :backtrace)
      end
    end
  end

  def validation_output
    Jbuilder.encode do |json|
      json.status 500
      json.error do
        self.errors.each do |attribute, err|
          json.property attribute.to_s
          json.message err
        end
      end
    end
  end

end
