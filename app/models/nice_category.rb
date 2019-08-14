class NiceCategory < ApplicationRecord
  has_many :nice_areas
  has_many :nice_work_roles, through: :nice_areas
end
