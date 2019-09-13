class NiceWorkRolesController < ApplicationController
  def index
    @nice_work_roles = NiceWorkRole.all
  end

  def show
    @nice_work_role = NiceWorkRole.find_by(acronym: params[:acronym])
  end
end