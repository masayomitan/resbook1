class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :validatable, password_length: 4..128

  validates :name, presence: true, length: { maximum: 20 }
  validates :email,                 presence: true, uniqueness: { case_sensitive: false }
  has_many :reservations, dependent: :destroy

  has_many :reviews
end
