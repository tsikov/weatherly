class LocationsController < ApplicationController
  def index
  end

  def show
    @location = Location.find_by(city: params[:city],
                                 country: params[:country])
  end
end
