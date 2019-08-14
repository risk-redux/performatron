class NiceKnowledgesController < ApplicationController
  def index
    @knowledges = NiceKnowledge.all
  end

  def show
    @knowledge = NiceKnowledge.find_by(acronym: params[:acronym])
  end
end
