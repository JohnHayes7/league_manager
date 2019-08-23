class CompetitionsController < ApplicationController
    before_action :admin_login, except: [:new, :show, :standings, :active]

    def new
        @comp = Competition.new
    end

    def create
        @comp = Competition.new(comp_params)
        if params[:season_id]
            @comp.season_id = params[:season_id]
            @comp.save
            redirect_to season_path(params[:season_id])
        else
            # 39 is a dummy season
            @comp.season_id = 39
            @comp.save
            redirect_to seasons_path
        end
    end

    def show 
        @comp = Competition.find(params[:id])
        @seasons = Season.order(year: :desc)
    end

    def edit
        @comp = Competition.find(params[:id])
    end

   def update
        @comp = Competition.find(params[:id])
        @comp.update(comp_params)
        if @comp.save
            redirect_to competition_path(@comp)
        else
            render :edit
        end
   end

    def standings
        @teams = Team.order(:wins)
    end

    def active
        @comps = Competition.most_active
    end

    private

    def comp_params
        params.require(:competition).permit(:name)
    end

    def admin_login
        unless admin_logged_in?
            flash[:error] = "You must be an administrator to continue"
            redirect_to login_path
        end
    end

end