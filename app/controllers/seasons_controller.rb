class SeasonsController < ApplicationController
    
    def new
        @season = Season.new
    end

    def create
        
        @season = Season.new(season_params)
        binding.pry
    end


    private

    def season_params
        params.require(:season).permit(:year)
    end
end