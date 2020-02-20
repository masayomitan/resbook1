class Image < ApplicationRecord

  belongs_to :restaurant, optional: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader

end
