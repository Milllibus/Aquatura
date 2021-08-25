class Specie < ApplicationRecord
  has_many :plants, dependent: :destroy
end
