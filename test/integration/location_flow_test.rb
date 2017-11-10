require 'test_helper'

class LocationFlowTest < ActionDispatch::IntegrationTest
  test "can go to a new location" do
    VCR.use_cassette("openweathermap", record: :new_episodes) do
      get "/location?city=sofia&country=bulgaria"

      assert_select "h1", "Sofia, Bulgaria"
    end
    Location.last.destroy
  end
end
