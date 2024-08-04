class Shift < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :week
  belongs_to :service
  has_many :availabilities

  enum status: {
    unassigned: 0,
    assigned: 1
  }
end
