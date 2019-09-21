class NiceWorkRolesController < ApplicationController
  def index
    @nice_work_roles = NiceWorkRole.all
  end

  def show
    @nice_work_role = NiceWorkRole.find_by(acronym: params[:acronym])
  end

  def show_dimension
    @nice_work_role = NiceWorkRole.find_by(acronym: params[:acronym])

    unless @nice_work_role.nil?
      case params[:dimension].to_sym
      when :knowledge
        render json: @nice_work_role.nice_knowledges.to_json
      when :skills
        render json: @nice_work_role.nice_skills.to_json
      when :abilities
        render json: @nice_work_role.nice_abilities.to_json
      when :tasks
        render json: @nice_work_role.nice_tasks.to_json
      else
        render json: nil
      end
    else
      render json: nil
    end
  end

  def show_similarity_map
    @nice_work_role = NiceWorkRole.find_by(acronym: params[:acronym])

    unless @nice_work_role.nil?
      @similarity_map = {}

      NiceWorkRole.all.each do |target_nice_work_role|
        @similarity_map[target_nice_work_role.acronym] = @nice_work_role.similarity_map(target_nice_work_role, params[:dimension])
      end

      render json: @similarity_map
    else
      render json: nil
    end
  end
end