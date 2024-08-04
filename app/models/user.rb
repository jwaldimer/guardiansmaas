class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  before_create :generate_unique_color
    
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :shifts
  has_many :availabilities

  private

  def generate_unique_color
    self.color = loop do
      color = SecureRandom.hex(3)
      break random_color unless User.exists?(color: color)
    end
  end
end
