class NiceSkillsController < ApplicationController
  def index
    @skills = NiceSkill.all

    respond_to do |format|
      format.html {}
      format.json {
        render json: @skills.as_json(except: [:id, :created_at, :updated_at]) 
      }
    end
  end

  def show
    @skill = NiceSkill.find_by(acronym: params[:acronym])

    respond_to do |format|
      format.html {}
      format.json {
        render json: @skill.as_json(except: [:id, :created_at, :updated_at],
        include: [
          nice_work_roles: { except: [:id, :nice_area_id, :description, :munge, :opm_code, :created_at, :updated_at] }
        ]) 
      }
    end
  end
end
