class NiceAbilitiesController < ApplicationController
  def index
    @abilities = NiceAbility.all
  end

  def show
    @ability = NiceAbility.find_by(acronym: params[:acronym])
  end

  def show_similarity_map
    @similarity_map = {}

    NiceWorkRole.all.each do |source_nice_work_role|
      @similarity_map[source_nice_work_role.acronym] = {}
      NiceWorkRole.all.each do |target_nice_work_role|
        @similarity_map[source_nice_work_role.acronym][target_nice_work_role.acronym] = source_nice_work_role.similarity_map(target_nice_work_role, :abilities)
      end
    end

    render json: @similarity_map
  end
end
