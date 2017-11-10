require "application_system_test_case"

class LocationsTest < ApplicationSystemTestCase
  test "should be able to find the weather for a location" do
    VCR.use_cassette("openweathermap", record: :new_episodes) do
      visit root_url

      fill_in "city", with: "Barcelona"
      fill_in "country", with: "Spain"

      click_on "OK"

      assert_selector "h1", text: "Barcelona, Spain"

      assert_text /The temperature is \d+\.\d+ degrees/
    end
  end

  test 'should be able to pick a random location' do
    VCR.use_cassette("openweathermap", record: :new_episodes) do
      Location.create(city: "Barcelona", country: "Spain")
      Location.create(city: "Berlin", country: "Germany")

      visit root_url
      click_on "Visit a random location"

      assert_selector "h1", text: /\w+\, \w+/
      assert_text /The temperature is \d+\.\d+ degrees/
    end
  end

  test 'should display location not found if location does not exist' do
    VCR.use_cassette("openweathermap", record: :new_episodes) do
      visit root_url

      fill_in "city", with: "Atlantis"
      fill_in "country", with: "Greece"

      click_on "OK"

      assert_text /Location not found/
    end
  end
end
