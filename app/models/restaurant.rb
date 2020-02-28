class Restaurant < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  belongs_to :user, optional: true
  
  
  has_many :images, foreign_key: :restaurant_id, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  
  
  has_many :reservations
  has_many :reviews, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  validates :restaurant_name,   presence: true
  validates :describe, presence: true, length: { in: 1..800 }
  validates :address,                  null: false
  validates :tel,                      null: false
  validates :average_price_lunch,      null: false
  validates :average_price_dinner,     null: false
  validates :genre,                    null: false
  
  
end
