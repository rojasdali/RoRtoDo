class ProjectsController < ApplicationController
  before_action :set_project, except: %i[index new create]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html {
                      redirect_to project_path(@project),
                      notice: 'Project was successfully created.'
                    }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html {
                      redirect_to project_path(@project),
                      notice: 'Project was successfully updated.'
                    }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html {
                    redirect_to projects_path,
                    notice: 'Project was successfully destroyed.'
                  }
    end
  end

  def clear
    if @project.items.complete.length < 1
      respond_to do |format|
        format.html {
                      redirect_to project_path(@project),
                      notice: 'There are no completed items for this project.'
                    }
                end
                  else
    if @project.items.complete.update(deleted?:true)
    respond_to do |format|
      format.html {
                    redirect_to project_path(@project),

                    notice: 'Completed items were successfully cleared.'
                  }
      end
    end
  end
end

private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title)
  end
end

