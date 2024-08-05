class Availability < ApplicationRecord
  belongs_to :user
  belongs_to :shift

  validates :shift_id, uniqueness: { scope: :user_id }
end
