class NiceWorkRole < ApplicationRecord
  belongs_to :nice_category

  has_many :nice_task_mappings
  has_many :nice_tasks, through: :nice_task_mappings
  
  has_many :nice_knowledge_mappings
  has_many :nice_knowledges, through: :nice_knowledge_mappings

  has_many :nice_skill_mappings
  has_many :nice_skills, through: :nice_skill_mappings

  def self.search(search)
    @hits = Hash.new

    if search && search.length > 0
      work_roles = NiceWorkRole.all
      tasks = NiceTask.all
      knowledges = NiceKnowledge.all
      skills = NiceSkill.all

      regexp_search = Regexp.new(search, Regexp::IGNORECASE)

      @hits["search"] = search

      @hits["work_roles"] = work_roles.select{ |work_role| regexp_search.match(work_role.name) || 
        regexp_search.match(work_role.work_role_code) || 
        regexp_search.match(work_role.description)
      }

      @hits["knowledges"] = knowledges.select{ |knowledge| regexp_search.match(knowledge.knowledge_code) || 
        regexp_search.match(knowledge.description)
      }

      @hits["tasks"] = tasks.select{ |task| regexp_search.match(task.task_code) || 
        regexp_search.match(task.description)
      }

      @hits["skills"] = skills.select{ |skill| regexp_search.match(skill.skill_code) || 
        regexp_search.match(skill.description)
      }
    else
      @hits["search"] = ""
    end

    return @hits
  end
end
