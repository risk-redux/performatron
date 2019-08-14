class NiceAbilitiesController < ApplicationController
  def index
    @abilities = NiceAbility.all
  end

  def show
    @ability = NiceAbility.find_by(acronym: params[:acronym])
  end
end
