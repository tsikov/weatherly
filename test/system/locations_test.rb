require "application_system_test_case"

class LocationsTest < ApplicationSystemTestCase
  test "should be able to find the weather for a location" do
    visit root_url

    fill_in "city", with: "Barcelona"
    fill_in "country", with: "Spain"

    click_on "OK"

    assert_selector "h1", text: "Barcelona, Spain"

    assert_text /The temperature is \d+ degrees/
    assert_text /The temperature is \d+\.\d+ degrees/
  end
end
