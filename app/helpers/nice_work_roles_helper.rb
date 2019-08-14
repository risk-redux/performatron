module NiceWorkRolesHelper
  def ksat_table(type, ksat_data)
    data = []

    case type
    when :knowledge
      ksat_data.each { |mapping| data.push(mapping.nice_knowledge) }
    when :skills
      ksat_data.each { |mapping| data.push(mapping.nice_skill) }
    when :abilities
      ksat_data.each { |mapping| data.push(mapping.nice_ability) }
    when :tasks
      ksat_data.each { |mapping| data.push(mapping.nice_task) }
    end

    render("nice_work_roles/shared/ksat_table", type: type, ksat_data: data)
  end

  def ksat_card(type, ksat_data)
    data = []

    case type
    when :knowledge
      ksat_data.each { |mapping| data.push(mapping.nice_knowledge) }
    when :skills
      ksat_data.each { |mapping| data.push(mapping.nice_skill) }
    when :abilities
      ksat_data.each { |mapping| data.push(mapping.nice_ability) }
    when :tasks
      ksat_data.each { |mapping| data.push(mapping.nice_task) }
    end

    render("nice_work_roles/shared/ksat_card", type: type, ksat_data: data)
  end
end
