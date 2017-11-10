class LocationsController < ApplicationController
  def index
  end

  def show
    @location = Location.find_by(city: params[:city],
                                 country: params[:country])
    redirect_to location_not_found_path unless @location
  end

  def random
    location = Location.random
    redirect_to location_path(city: location.city, country: location.country)
  end

  def not_found
  end
end
