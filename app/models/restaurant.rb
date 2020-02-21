class Restaurant < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :more_info, foreign_key: :restaurant_id, dependent: :destroy
  has_many :images, foreign_key: :restaurant_id, dependent: :destroy
  has_many :reservations

  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :more_info, allow_destroy: true
end
