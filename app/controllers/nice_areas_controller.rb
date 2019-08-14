class NiceAreasController < ApplicationController
  def index
    @nice_areas = NiceArea.all
  end

  def show
    @nice_area = NiceArea.find_by(acronym: params[:acronym])
  end
end
