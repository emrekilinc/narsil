class ProjectController < ApplicationController
  ## GET : '/projects'
  def index
    @projects = Project.order("created_at")
  end

  ## GET : '/projects/new'
  def new
  end

  ## POST : '/projects/create'
  def create
    create_params = {
      name: params[:name],
      body: params[:body],
      logo: params[:logo],
      primary_color: params[:primary_color],
      code: params[:code],
      is_active: params[:is_active] == "on"
    }

    project = Project.new(create_params)
    
    if project.save
      flash[:success] = "Created project successfully."
      redirect_to controller: "project", action: "index"
    else
      flash[:alert] = project.errors if project.errors.count > 0
      redirect_to controller: "project", action: "new"
    end
  end

  ## GET : '/projects/:id'
  def show
    @project = Project.find(params[:id])
    @errors = Error.where(project_code: @project.code).paginate(:page => params[:page], :per_page => 100)
    respond_to :html
  end

  def edit
    @project = Project.find(params[:id])
    respond_to :html
  end

  def update
    update_params = {
      name: params[:name],
      body: params[:body],
      logo: params[:logo],
      primary_color: params[:primary_color],
      code: params[:code],
      is_active: params[:is_active] == "on"
    }

    project = Project.find(params[:id])
    
    if project.update_attributes(update_params)
      flash[:success] = "Updated project successfully."
      redirect_to controller: "project", action: "index"
    else
      flash[:alert] = project.errors if project.errors.count > 0
      redirect_to controller: "project", action: "edit", id: project.id
    end
  end
end