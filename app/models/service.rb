class Service < ApplicationRecord
  has_one :contract
  has_many :shifts
end
