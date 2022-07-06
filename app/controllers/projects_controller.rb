class ProjectsController < ApplicationController
  def all
    @projects = Project.all.order(created_at: :desc)
  end

  def new
    @project = Project.new
  end

  def created
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_all_path , notice: 'The project was successfully created'
    else
      redirect_to projects_new_path , alert: 'We couldnt create the project, please try again.'
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :start_date, :end_date, :state )
  end
end
