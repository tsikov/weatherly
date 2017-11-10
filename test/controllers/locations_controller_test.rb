require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    VCR.use_cassette("openweathermap", record: :new_episodes) do
      get location_url, params: { city: 'Barcelona', country: 'Spain' }
      assert_response :success
    end
  end

end
