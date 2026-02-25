class NiceWorkRolesController < ApplicationController
  def index
    @nice_work_roles = NiceWorkRole.all

    respond_to do |format|
      format.html {}
      format.json {
        render json: @nice_work_roles.as_json(except: [:id, :nice_category_id, :created_at, :updated_at]) 
      }
    end
  end

  def show
    @nice_work_role = NiceWorkRole.find_by(work_role_code: params[:work_role_code])

    respond_to do |format|
      format.html {}
      format.json {
        render json: @nice_work_role.as_json(except: [:id, :nice_category_id, :created_at, :updated_at],
        include: [
          nice_tasks: { except: [:id, :description, :created_at, :updated_at] },
          nice_knowledges: { except: [:id, :description, :created_at, :updated_at] },
          nice_skills: { except: [:id, :description, :created_at, :updated_at] }
        ]) 
      }
    end
  end
end
