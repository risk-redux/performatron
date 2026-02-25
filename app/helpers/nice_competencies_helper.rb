module NiceCompetenciesHelper
  def nice_competencies_periodic_table(competencies)
    render("nice_competencies/shared/nice_competencies_periodic_table", competencies: competencies)
  end

  def nice_competencies_table(competencies)
    render("shared/nice_competencies_table", competencies: competencies)
  end
end
