module ApplicationHelper
  # Quick way to automate pretty page titles.
  def view_title(page_title)
    content_for(:title) { page_title }
  end

  # Quick way to highlight active navigation bar areas.
  def is_active?(controller_action)
    "#{params[:controller]}\##{params[:action]}" == controller_action ? "active" : nil
  end

  def nice_knowledges_table(knowledges)
    render("shared/nice_knowledges_table", knowledges: knowledges)
  end

  def nice_skills_table(skills)
    render("shared/nice_skills_table", skills: skills)
  end

  def nice_abilities_table(abilities)
    render("shared/nice_abilities_table", abilities: abilities)
  end

  def nice_tasks_table(tasks)
    render("shared/nice_tasks_table", tasks: tasks)
  end

  def nice_work_roles_table(work_roles)
    render("shared/nice_work_roles_table", work_roles: work_roles)
  end

  def nice_work_roles_arc_diagram(similarity_map, dimension)
    data = { 'nodes': [], 'links': [] }

    similarity_map.each do |source_work_role, maps|
      data[:nodes].push({
        'name': source_work_role.acronym,
        'n': 5, #work_role.nice_knowledges.count,
        'grp': source_work_role.nice_area.nice_category.id,
        'id': source_work_role.id,
      })

      similarity_map[source_work_role][dimension].each do |target_work_role, value|
        unless value.count < 2
          data[:links].push({
            "source": source_work_role.id,
            "target": target_work_role.id,
            "value": value.count
          })
        end
      end
    end

    render("nice_work_roles/shared/nice_work_roles_arc_diagram", dimension: dimension, data: json_escape(data.to_json).html_safe)
  end
end
