class NiceTasksController < ApplicationController
  def index
    @tasks = NiceTask.all

    respond_to do |format|
      format.html {}
      format.json {
        render json: @tasks.as_json(except: [:id, :created_at, :updated_at]) 
      }
    end
  end

  def show
    @task = NiceTask.find_by(task_code: params[:task_code])

    respond_to do |format|
      format.html {}
      format.json {
        render json: @task.as_json(except: [:id, :created_at, :updated_at],
        include: [
          nice_work_roles: { except: [:id, :nice_category_id, :description, :munge, :opm_code, :created_at, :updated_at] }
        ]) 
      }
    end
  end
end
