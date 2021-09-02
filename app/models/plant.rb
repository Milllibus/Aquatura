class Plant < ApplicationRecord
  EXPOSURES = %w[sun half shade]
  validates :nickname, presence: true
  validates :exposure, presence: true, inclusion: EXPOSURES

  belongs_to :specie
  belongs_to :user
  has_many :waterings, dependent: :destroy

  # rubocop:disable Metrics/MethodLength

  def dates_of_watering(period_length)
    dates = []
    plant = self
    frequency = plant.specie.watering_frequency
    first_date = plant.waterings.empty? ? Date.today : plant.waterings.max_by(&:water_date).water_date + frequency
    first_date = Date.today if (first_date - Date.today).negative?
    dates << first_date.to_time
    ((period_length / frequency) - 1).to_i.times do
      date = (dates.last.to_date + frequency)
      dates << date.to_time
    end
    return dates
  end

  def need_watering?(days, days_start = 0)
    # self.dates_of_watering(days).first < Date.today + days_start + days && self.dates_of_watering(days).first > Date.today + days_start
    self.dates_of_watering(30).any? do |date|
      date.to_date < Date.today + days_start + days && date.to_date >= Date.today + days_start
    end
  end

  def last_watering
    self.waterings.order(water_date: :desc).first
  end

  def plant_energy
    plant = self
    days_that_i_last_water = Date.today - plant.waterings.order(water_date: :desc).first.water_date - 2

    if days_that_i_last_water < plant.specie.watering_frequency.to_i
      90
    elsif days_that_i_last_water < 2 * plant.specie.watering_frequency.to_i
      60
    elsif days_that_i_last_water < 3 * plant.specie.watering_frequency.to_i
      40
    else
      20
    end
  end

end
