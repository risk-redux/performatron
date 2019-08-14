class NiceSkillsController < ApplicationController
  def index
    @skills = NiceSkill.all
  end

  def show
    @skill = NiceSkill.find_by(acronym: params[:acronym])
  end
end
