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
    first_date = plant.waterings.empty? ? Date.today : plant.waterings.max_by(&:created_at).created_at.to_date + frequency
    first_date = Date.today if first_date.to_date - Date.today < 0
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

  #auj : need_watering?(1)
  # rubocop:enable Metrics/MethodLength

  def plant_energy
    days_that_i_last_water = Date.today.to_date - self.waterings.order(created_at: :desc).first.created_at.to_date - 2

    # last_watering_date = (self.dates_of_watering(30).first.to_date - self.specie.watering_frequency.to_i)
    # before_last_watering = (last_watering_date - self.specie.watering_frequency.to_i)
    # before_before_last_watering = (before_last_watering - self.specie.watering_frequency.to_i)
    if days_that_i_last_water < self.specie.watering_frequency.to_i
      90
    elsif days_that_i_last_water < 2 * self.specie.watering_frequency.to_i
      60
    elsif days_that_i_last_water < 3 * self.specie.watering_frequency.to_i
      40
    else
      20
    end
  end

end
