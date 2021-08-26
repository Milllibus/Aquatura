class Plant < ApplicationRecord
  EXPOSURES = %w[sun half shaddow]
  validates :nickname, presence: true
  validates :exposure, presence: true, inclusion: EXPOSURES

  belongs_to :specie
  belongs_to :user
  has_many :waterings, dependent: :destroy
end
