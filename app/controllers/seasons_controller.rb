class SeasonsController < ApplicationController
    
    def new
        @season = Season.new
    end

    def create
        @season = Season.find_or_create_by(:id => params[:id])
        binding.pry
    end
end