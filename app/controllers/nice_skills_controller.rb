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
    @skill = NiceSkill.find_by(skill_code: params[:skill_code])

    respond_to do |format|
      format.html {}
      format.json {
        render json: @skill.as_json(except: [:id, :created_at, :updated_at],
        include: [
          nice_work_roles: { except: [:id, :nice_category_id, :description, :munge, :opm_code, :created_at, :updated_at] }
        ]) 
      }
    end
  end
end
