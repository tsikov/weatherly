require "application_system_test_case"

class LocationsTest < ApplicationSystemTestCase
  test "should be able to find the weather for a location" do
    visit locations_url("Barcelona,Spain")

    assert_selector "h1", text: "Barcelona, Spain"
  end
end
