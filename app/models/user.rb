class User < ApplicationRecord
  has_many :plants, dependent: :destroy
  has_one :eplant, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def plants_need_watering?(days, days_start = 0)
    self.plants.any? { |plant| plant.need_watering?(days, days_start) }
  end

  def plants_to_water(days, days_start = 0)
    self.plants.select { |plant| plant.need_watering?(days, days_start) }
  end

end
