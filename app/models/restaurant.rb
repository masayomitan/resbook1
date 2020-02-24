class Restaurant < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  belongs_to :user, optional: true
  has_many :images, foreign_key: :restaurant_id, dependent: :destroy
  has_many :reservations

  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  validates :restaurant_name,   presence: true
  validates :describe, presence: true
  validates :address,                  null: false
  validates :tel,                      null: false
  validates :average_price_lunch,      null: false
  validates :average_price_dinner,     null: false
  validates :genre,                    null: false


  accepts_nested_attributes_for :images, allow_destroy: true
  

  
end
