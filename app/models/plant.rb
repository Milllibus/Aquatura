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
    last_watering = (self.dates_of_watering(30).first.to_date - self.specie.watering_frequency.to_i)
    before_last_watering = (last_watering - self.specie.watering_frequency.to_i)
    before_before_last_watering = (before_last_watering - self.specie.watering_frequency.to_i)
    if last_watering.nil?
      90
    elsif before_last_watering.nil?
      60
    elsif before_before_last_watering.nil?
      30
    else
      0
    end
    [30,60,90].sample
  end

end
