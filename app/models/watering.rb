class Watering < ApplicationRecord
  belongs_to :plant

  validates :created_at, uniqueness: { scope: :plant }
end
