class SeasonsController < ApplicationController
    
    def new
        if admin_logged_in?
            @season = Season.new
            @season.competitions.build
        else
            flash[:error] = "Only Administrators can create a new season"
            redirect_to login_path
        end
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
        if admin_logged_in?
            @season = Season.find(params[:id])
        else
            flash[:error] = "You Must be an Administrator to edit a season"
            redirect_to login_path
        end
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
        if admin_logged_in?
            Season.destroy(params[:id])

            redirect_to seasons_path
        end
    end

    private

    def season_params
        params.require(:season).permit(:year, competition_ids:[], competitions_attributes:[:name])
    end
end