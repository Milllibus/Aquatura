class Plant < ApplicationRecord
  validates :nickname, presence: true
  validates :exposure, presence: true
  belongs_to :specie
  belongs_to :user
  has_many :waterings, dependent: :destroy
end
