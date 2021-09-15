class Tea < ApplicationRecord
  has_many :subscriptions

  validates :title, presence: true
  validates :description, presence: true
  validates :temperature_in_fahrenheit, presence: true
  validates :brew_time_in_minutes, presence: true
end
