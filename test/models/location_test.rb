require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test 'should have a city and a country' do
    refute Location.new.save
  end
end
