class NiceTask < ApplicationRecord
  has_many :nice_task_mappings
  has_many :nice_work_roles, through: :nice_task_mappings
end
