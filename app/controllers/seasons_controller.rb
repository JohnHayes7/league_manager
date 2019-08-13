class SeasonsController < ApplicationController
    
    def new
        @season = Season.new
        @season.competitions.build
    end

    def create
        
        @season = Season.new(season_params)
        if @season.save
            redirect_to season_path(@season)
        end
    end

    def show
        @season = Season.find_by(:id => params[:id])
        @seasons = Season.all
    end

    def edit
        @season = Season.find(params[:id])
    end

    def index
        @seasons = Season.all
    end

    def update

        @season = Season.find(params[:id])
        @season.update(season_params)
        if @season.save
            redirect_to season_path(@season)
        else
            render :edit
        end
    end

    def destroy
        if logged_in? && current_user.admin?
            Season.destroy(params[:id])

            redirect_to seasons_path
        end
    end

    private

    def season_params
        params.require(:season).permit(:year, competition_ids:[], competitions_attributes:[:name])
    end
end