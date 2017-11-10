require 'test_helper'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

class WeatherTest < ActiveSupport::TestCase

  test 'should have temp, pressure, humidity and location' do
    refute Weather.new(location: Location.first).save

    weather = Weather.new(temp: 1, pressure: 2,
                          humidity: 3, location: Location.first)
    assert weather.save
  end

  test 'should get the current weather for a location' do
    VCR.use_cassette("openweathermap", record: :new_episodes) do
      weather = Weather.search("Barcelona,Spain")
      assert_kind_of Numeric, weather.temp
    end
  end

  test 'should return "not found" if the location is not found' do
    VCR.use_cassette("openweathermap", record: :new_episodes) do
      weather = Weather.search("Atlantis,Greece")
      refute weather
    end
  end

  test 'should get the current weather from the database if it is saved' do
    location = Location.first
    weather = Weather.create!(temp: 3.14, pressure: 2,
                              humidity: 3, location: location)
    weather = Weather.current(location)
    assert_equal 3.14, weather.temp
  end

  test 'should get the current weather from the API if it is not saved' do
    VCR.use_cassette("openweathermap", record: :new_episodes) do
      location = Location.first
      Weather.destroy_all
      weather = Weather.current(location)
      assert_kind_of Numeric, weather.temp
      assert Weather.first
    end
  end

end
