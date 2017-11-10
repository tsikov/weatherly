class Location < ApplicationRecord
  validates :city, :country, presence: true

  has_many :weathers

  def last_weather
    Weather.where(location: self).last
  end

  def print
    "#{city},#{country}"
  end
end
