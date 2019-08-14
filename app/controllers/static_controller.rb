class StaticController < ApplicationController

  def index
    @nice_categories = NiceCategory.all
    @nice_areas = NiceArea.all
    @nice_work_roles = NiceWorkRole.all

    @nice_knowledges = NiceKnowledge.all
    @nice_skills = NiceSkill.all
    @nice_abilities = NiceAbility.all
    @nice_tasks = NiceTask.all

    @search = params[:search]
    @hits = NiceWorkRole.search(params[:search])

    render action: "index"
  end

  def about
  end
end
