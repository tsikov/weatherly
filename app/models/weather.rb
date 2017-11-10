require 'open-uri'

class Weather < ApplicationRecord

  belongs_to :location

  validates :temp, :pressure, :humidity, presence: true

  scope :within_24h, lambda { where("created_at >= ?", 1.day.ago) }

  def self.search(location)
    api_key = ENV['owm_key']
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=#{api_key}"

    begin
      response = JSON.parse(open(url).read)
    rescue OpenURI::HTTPError
      return false
    end

    weather = response["main"]

    city, country = location.split(",")
    location = Location.find_by(city: city, country: country)
    Weather.new(location: location,
                temp: weather["temp"],
                humidity: weather["humidity"],
                pressure: weather["pressure"])
  end

  def self.current(location)
    weather = Weather.where(location: location).within_24h.first
    if weather
      weather
    else
      weather = Weather.search(location.print)
      weather.save
      weather
    end
  end
end
