module NiceAreasHelper
  def nice_areas_periodic_table(areas)
    render("nice_areas/shared/nice_areas_periodic_table", areas: areas)
  end

  def nice_areas_table(areas)
    render("shared/nice_areas_table", areas: areas)
  end
end
