class NiceWorkRole < ApplicationRecord
  belongs_to :nice_area

  has_many :nice_knowledge_mappings
  has_many :nice_knowledges, through: :nice_knowledge_mappings

  has_many :nice_skill_mappings
  has_many :nice_skills, through: :nice_skill_mappings

  has_many :nice_ability_mappings
  has_many :nice_abilities, through: :nice_ability_mappings

  has_many :nice_task_mappings
  has_many :nice_tasks, through: :nice_task_mappings

  def self.search(search)
    @hits = Hash.new

    if search && search.length > 0
      work_roles = NiceWorkRole.all
      knowledges = NiceKnowledge.all
      skills = NiceSkill.all
      abilities = NiceAbility.all
      tasks = NiceTask.all

      regexp_search = Regexp.new(search, Regexp::IGNORECASE)

      @hits["search"] = search

      @hits["work_roles"] = work_roles.select{ |work_role| regexp_search.match(work_role.name) || 
        regexp_search.match(work_role.acronym) || 
        regexp_search.match(work_role.description)
      }

      @hits["knowledges"] = knowledges.select{ |knowledge| regexp_search.match(knowledge.acronym) || 
        regexp_search.match(knowledge.description)
      }

      @hits["skills"] = skills.select{ |skill| regexp_search.match(skill.acronym) || 
        regexp_search.match(skill.description)
      }

      @hits["abilities"] = abilities.select{ |ability| regexp_search.match(ability.acronym) || 
        regexp_search.match(ability.description)
      }

      @hits["tasks"] = tasks.select{ |task| regexp_search.match(task.acronym) || 
        regexp_search.match(task.description)
      }
    else
      @hits["search"] = ""
    end

    return @hits
  end

  def similarity_map(target_nice_work_role, dimension = :knowledge)
    similarity_map = []

    case dimension.to_sym
    when :knowledge
      similarity_map = shared_knowledge(self, target_nice_work_role)
    when :skills
      similarity_map = shared_skills(self, target_nice_work_role)
    when :abilities
      similarity_map = shared_abilities(self, target_nice_work_role)
    when :tasks
      similarity_map = shared_tasks(self, target_nice_work_role)
    end

    return similarity_map
  end

  private

  def shared_knowledge(source, target)
    return source.nice_knowledges & target.nice_knowledges
  end

  def shared_skills(source, target)
    return source.nice_skills & target.nice_skills
  end

  def shared_abilities(source, target)
    return source.nice_abilities & target.nice_abilities
  end

  def shared_tasks(source, target)
    return source.nice_tasks & target.nice_tasks
  end
end
