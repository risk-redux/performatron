class NiceWorkRolesController < ApplicationController
  def index
    @nice_work_roles = NiceWorkRole.all

    @similarity_map = NiceWorkRole.similarity_map
  end

  def show
    @nice_work_role = NiceWorkRole.find_by(acronym: params[:acronym])
  end
end
