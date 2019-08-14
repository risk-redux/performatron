module NiceCategoriesHelper
  def nice_categories_periodic_table(categories)
    render("nice_categories/shared/nice_categories_periodic_table", categories: categories)
  end

  def nice_categories_table(categories)
    render("shared/nice_categories_table", categories: categories)
  end
end
