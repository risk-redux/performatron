class NiceAbilitiesController < ApplicationController
  def index
    @abilities = NiceAbility.all

    respond_to do |format|
      format.html {}
      format.json {
        render json: @abilities.as_json(except: [:id, :created_at, :updated_at]) 
      }
    end
  end

  def show
    @ability = NiceAbility.find_by(acronym: params[:acronym])

    respond_to do |format|
      format.html {}
      format.json {
        render json: @ability.as_json(except: [:id, :created_at, :updated_at],
        include: [
          nice_work_roles: { except: [:id, :nice_area_id, :description, :munge, :opm_code, :created_at, :updated_at] }
        ]) 
      }
    end
  end
end
