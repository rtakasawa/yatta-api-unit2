class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :materials, dependent: :destroy
  has_many :works, through: :materials
  validates :name, presence: true

  # ゲストユーザー用
  def self.guest
    guest_user = 'guest@example.com'
    find_or_create_by!(name: guest_user, email: guest_user) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.zone.now
    end
  end
end
