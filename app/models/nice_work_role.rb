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
end
