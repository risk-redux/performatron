class NiceAreasController < ApplicationController
  def index
    @nice_areas = NiceArea.all

    respond_to do |format|
      format.html {}
      format.json {
        render json: @nice_areas.as_json(except: [:id, :nice_category_id, :created_at, :updated_at]) 
      }
    end
  end

  def show
    @nice_area = NiceArea.find_by(acronym: params[:acronym])

    respond_to do |format|
      format.html {}
      format.json {
        render json: @nice_area.as_json(except: [:id, :nice_category_id, :created_at, :updated_at],
        include: [
          nice_work_roles: { except: [:id, :nice_area_id, :description, :munge, :opm_code, :created_at, :updated_at] }
        ]) 
      }
    end
  end
end
