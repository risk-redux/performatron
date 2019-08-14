class NiceKnowledge < ApplicationRecord
  has_many :nice_knowledge_mappings
  has_many :nice_work_roles, through: :nice_knowledge_mappings
end
