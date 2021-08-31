class Watering < ApplicationRecord
  belongs_to :plant

  validate :date_uniqueness?

  def date_uniqueness?
    waterings = Watering.where(plant_id: plant_id)
    waterings_dates = waterings.map do |watering|
      watering.created_at.to_date
    end
    errors.add(:field, 'error message') if waterings_dates.include?(Date.today)
  end

end
