class NiceAbility < ApplicationRecord
  has_many :nice_ability_mappings
  has_many :nice_work_roles, through: :nice_ability_mappings
end
