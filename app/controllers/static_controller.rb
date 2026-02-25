class StaticController < ApplicationController

  def index
    @nice_categories = NiceCategory.all
    @nice_competencies = NiceCompetency.all
    @nice_work_roles = NiceWorkRole.all

    @nice_knowledges = NiceKnowledge.all
    @nice_skills = NiceSkill.all
    @nice_tasks = NiceTask.all

    @search = search_parameters
    @hits = NiceWorkRole.search(@search)

    @placeholder = NiceWorkRole.select(:name).sample(1).first.name.titlecase

    respond_to do |format|
      format.html
      format.js
      format.json { render json: @hits.to_json }
    end
  end

  def about
  end

  private

  def search_parameters
    params[:search].to_s
  end

end
