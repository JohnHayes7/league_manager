class SeasonsController < ApplicationController
    
    def new
        @season = Season.new
        @season.competitions.build
    end

    def create
        # raise params.inspect
        @season = Season.new(season_params)
        if @season.save

            redirect_to season_path(@season)
        end
        
    end

    def show

    end


    private

    def season_params
        params.require(:season).permit(:year, competitions_attributes:[:name])
    end
end