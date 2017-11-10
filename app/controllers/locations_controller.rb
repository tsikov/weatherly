class LocationsController < ApplicationController
  def index
  end

  def show
    city = params[:city]
    country = params[:country]
    @location = Location.find_by(city: city,
                                 country: country)
    if @location
      @weather = Weather.current(@location)
    else
      @weather = Weather.search("#{city},#{country}")
      if @weather
        # new location -> save to db
        @location = Location.create!(city: city,
                                     country: country)
      else
        # location not found on 3rd party app
        redirect_to location_not_found_path
      end
    end
  end

  def random
    location = Location.random
    redirect_to location_path(city: location.city, country: location.country)
  end

  def not_found
  end
end
