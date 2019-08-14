class NiceTasksController < ApplicationController
  def index
    @tasks = NiceTask.all
  end

  def show
    @task = NiceTask.find_by(acronym: params[:acronym])
  end
end
