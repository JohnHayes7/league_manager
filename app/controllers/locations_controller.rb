class LocationsController < ApplicationController 

    def new
        @location = Location.new 
    end

    def create
        location = Location.new(location_params)
        if location.save
            redirect_to locations_path
        end
    end

    def index
        @locations = Location.all
    end

    private

    def location_params
        params.require(:location).permit(:name, :street_address, :city, :state, :zip_code)
    end
end