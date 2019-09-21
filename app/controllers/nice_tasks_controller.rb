class NiceTasksController < ApplicationController
  def index
    @tasks = NiceTask.all
  end

  def show
    @task = NiceTask.find_by(acronym: params[:acronym])
  end

  def show_similarity_map
    @similarity_map = {}

    NiceWorkRole.all.each do |source_nice_work_role|
      @similarity_map[source_nice_work_role.acronym] = {}
      NiceWorkRole.all.each do |target_nice_work_role|
        @similarity_map[source_nice_work_role.acronym][target_nice_work_role.acronym] = source_nice_work_role.similarity_map(target_nice_work_role, :tasks)
      end
    end

    render json: @similarity_map
  end
end
