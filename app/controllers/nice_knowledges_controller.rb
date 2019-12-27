class NiceKnowledgesController < ApplicationController
  def index
    @knowledges = NiceKnowledge.all

    respond_to do |format|
      format.html {}
      format.json {
        render json: @knowledges.as_json(except: [:id, :created_at, :updated_at]) 
      }
    end
  end

  def show
    @knowledge = NiceKnowledge.find_by(acronym: params[:acronym])

    respond_to do |format|
      format.html {}
      format.json {
        render json: @knowledge.as_json(except: [:id, :created_at, :updated_at],
        include: [
          nice_work_roles: { except: [:id, :nice_area_id, :description, :munge, :opm_code, :created_at, :updated_at] }
        ])
      }
    end
  end
end
