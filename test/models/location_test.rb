require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test 'should have a city and a country' do
    refute Location.new.save
  end

  test 'should be able to pick a random location id' do
    assert_kind_of Location, Location.random
  end
end
