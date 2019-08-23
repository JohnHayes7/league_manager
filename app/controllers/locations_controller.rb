class LocationsController < ApplicationController 

    before_action :admin_login, except: [:show, :index]

    def new
        @location = Location.new 
    end

    def create
        @location = Location.new(location_params)
        if @location.save
            redirect_to location_path(@location)
        else
            render :new
        end
    end

    def index
        @locations = Location.all
    end

    def show
        @location = Location.find(params[:id])
    end

    private

    def location_params
        params.require(:location).permit(:name, :street_address, :city, :state, :zip_code)
    end

    def admin_login
        unless admin_logged_in?
            flash[:error] = "You must be an administrator to continue"
            redirect_to login_path
        end
    end

    
end