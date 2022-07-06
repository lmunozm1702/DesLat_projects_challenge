class ProjectsController < ApplicationController
  def all
    @projects = Project.all.order(created_at: :desc)

    if params[:filter_state].present?
      @projects = Project.where("state = ?", params[:filter_state])
    end
  end

  def new
    @project = Project.new
  end

  def created
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_all_path , notice: 'The project was successfully created'
    else
      full_errors = ""
      @project.errors.full_messages.each do |msg|
        full_errors += msg + ". "
      end
      redirect_to projects_new_path , alert: 'We couldnt create the project, please try again. Try to fix: ' + full_errors
    end
  end
  
  private
  def project_params
    params.require(:project).permit(:name, :description, :start_date, :end_date, :state )
  end
end
