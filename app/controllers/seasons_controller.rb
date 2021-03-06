class SeasonsController < ApplicationController

    before_action :admin_login, except: [:show, :index]
    
    def new
        @season = Season.new
        @season.competitions.build
    end

    def create
        @season = Season.new(season_params)
        if @season.save
            redirect_to season_path(@season)
        else
            render :new
        end
    end

    def show
        @season = Season.find_by(:id => params[:id])
        @seasons = Season.order(year: :desc)
    end

    def edit
        @season = Season.find(params[:id])
    end

    def index
        @seasons = Season.order(year: :desc)
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
        Season.destroy(params[:id])

        redirect_to seasons_path
    end

    private

    def season_params
        params.require(:season).permit(:year, competition_ids:[], competitions_attributes:[:name])
    end

    def admin_login
        unless admin_logged_in?
            flash[:error] = "You must be an administrator to continue"
            redirect_to login_path
        end
    end
end