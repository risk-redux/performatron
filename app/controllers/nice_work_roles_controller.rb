class NiceWorkRolesController < ApplicationController
  def index
    @nice_work_roles = NiceWorkRole.all

    respond_to do |format|
      format.html {}
      format.json {
        render json: @nice_work_roles.as_json(except: [:id, :nice_area_id, :created_at, :updated_at]) 
      }
    end
  end

  def show
    @nice_work_role = NiceWorkRole.find_by(acronym: params[:acronym])

    respond_to do |format|
      format.html {}
      format.json {
        render json: @nice_work_role.as_json(except: [:id, :nice_area_id, :created_at, :updated_at],
        include: [
          nice_knowledges: { except: [:id, :description, :created_at, :updated_at] },
          nice_skills: { except: [:id, :description, :created_at, :updated_at] },
          nice_abilities: { except: [:id, :description, :created_at, :updated_at] },
          nice_tasks: { except: [:id, :description, :created_at, :updated_at] }
        ]) 
      }
    end
  end
end
