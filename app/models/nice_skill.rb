class NiceSkill < ApplicationRecord
  has_many :nice_skill_mappings
  has_many :nice_work_roles, through: :nice_skill_mappings
end
