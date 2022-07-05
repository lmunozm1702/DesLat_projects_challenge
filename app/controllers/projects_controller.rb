class ProjectsController < ApplicationController
  def all
  end

  def new
    @project = Project.new
  end

  def created
  end
end
