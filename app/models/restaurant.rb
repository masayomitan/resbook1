class Restaurant < ApplicationRecord

  belongs_to :user
  has_many :images, foreign_key: :restaurant_id, dependent: :destroy
  has_many :reservations

  validates :restaurant_name,   presence: true
  validates :describe, presence: true
  validates :address,                  null: false
  validates :tel,                      null: false
  validates :average_price_lunch,      null: false
  validates :average_price_dinner,     null: false
  validates :genre,                    null: false


  accepts_nested_attributes_for :images, allow_destroy: true
end
