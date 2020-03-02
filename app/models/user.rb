class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :validatable, password_length: 4..128

  validates :name, presence: true, length: { maximum: 20 }
  validates :email,                 presence: true, uniqueness: { case_sensitive: false }
  has_many :reservations, dependent: :destroy
  has_many :restaurant
  has_many :reviews

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  
end
