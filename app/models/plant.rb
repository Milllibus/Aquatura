class Plant < ApplicationRecord
  belongs_to :specie
  belongs_to :user
  has_many :waterings
end
