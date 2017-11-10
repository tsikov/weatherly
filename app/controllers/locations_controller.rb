class LocationsController < ApplicationController
  def index
  end

  def show
    @location = Location.find_by(city: params[:city],
                                 country: params[:country])
  end

  def random
    location = Location.random
    redirect_to location_path(city: location.city, country: location.country)
  end
end
