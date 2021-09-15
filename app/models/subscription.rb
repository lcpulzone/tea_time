class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer

  validates :title, presence: true
  validates :price, presence: true
  validates :frequency, presence: true

  enum status: { active: 0, cancelled: 1 }
end
