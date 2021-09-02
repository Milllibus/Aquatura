class Specie < ApplicationRecord
  has_many :plants, dependent: :destroy
  has_one :chatroom
end
