require "application_system_test_case"

class LocationsTest < ApplicationSystemTestCase
  test "should be able to find the weather for a location" do
    visit root_url

    fill_in "city", with: "Barcelona"
    fill_in "country", with: "Spain"

    click_on "OK"

    assert_selector "h1", text: "Barcelona, Spain"

    assert_text /The temperature is \d+\.\d+ degrees/
  end

  test 'should be able to pick a random location' do
    Location.create(city: "Barcelona", country: "Spain")
    Location.create(city: "Berlin", country: "Germany")

    visit root_url
    click_on "Visit a random location"

    assert_selector "h1", text: /\w+\, \w+/
    assert_text /The temperature is \d+\.\d+ degrees/
  end
end
