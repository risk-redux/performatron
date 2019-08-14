class NiceArea < ApplicationRecord
  belongs_to :nice_category
  
  has_many :nice_work_roles
end
