class Watering < ApplicationRecord
  belongs_to :plant

  validates :water_date, uniqueness: { scope: :plant }
end
