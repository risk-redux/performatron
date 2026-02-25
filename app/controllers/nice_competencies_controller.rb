class NiceCompetenciesController < ApplicationController
  def index
    @nice_competencies = NiceCompetency.all

    respond_to do |format|
      format.html {}
      format.json {
        render json: @nice_competencies.as_json(except: [:id, :nice_category_id, :created_at, :updated_at]) 
      }
    end
  end

  def show
    @nice_competency = NiceCompetency.find_by(competency_code: params[:competency_code])

    respond_to do |format|
      format.html {}
      format.json {
        render json: @nice_competency.as_json(except: [:id, :created_at, :updated_at],
        include: [
        ]) 
      }
    end
  end
end
