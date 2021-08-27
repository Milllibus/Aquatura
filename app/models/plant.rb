class Plant < ApplicationRecord
  EXPOSURES = %w[sun half shade]
  validates :nickname, presence: true
  validates :exposure, presence: true, inclusion: EXPOSURES

  belongs_to :specie
  belongs_to :user
  has_many :waterings, dependent: :destroy

  def dates_of_watering(period_length)
    dates = []
    plant = self
    frequency = plant.specie.watering_frequency
    first_date = plant.waterings.empty? ? Date.today : plant.waterings.max_by(&:created_at).created_at
    dates << (first_date + frequency)
    ((period_length / frequency) - 1).to_i.times do
      dates << (dates.last + frequency)
    end
    return dates
  end

  def need_watering?(days, days_start = 0)
    self.dates_of_watering(days).first < Date.today + days_start + days && self.dates_of_watering(days).first > Date.today + days_start
  end

  #auj : need_watering?(1)


end
