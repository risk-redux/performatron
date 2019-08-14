class NiceCategoriesController < ApplicationController
  def index
    @nice_categories = NiceCategory.all
  end

  def show
    @nice_category = NiceCategory.find_by(acronym: params[:acronym])
  end
end
