class NiceCategoriesController < ApplicationController
  def index
    @nice_categories = NiceCategory.all

    respond_to do |format|
      format.html {}
      format.json {
        render json: @nice_categories.as_json(except: [:id, :created_at, :updated_at]) 
      }
    end
  end

  def show
    @nice_category = NiceCategory.find_by(acronym: params[:acronym])

    respond_to do |format|
      format.html {}
      format.json {
        render json: @nice_category.as_json(except: [:id, :created_at, :updated_at],
        include: [
          nice_areas:  { except: [:id, :nice_category_id, :description, :created_at, :updated_at] }
        ])
      }
    end
  end
end
