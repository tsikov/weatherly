class Location < ApplicationRecord
  validates :city, :country, presence: true
end
