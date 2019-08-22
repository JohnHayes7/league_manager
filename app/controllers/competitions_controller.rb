class CompetitionsController < ApplicationController
    
    def new
        @comp = Competition.new
    end

    def create
        if admin_logged_in?
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
        else
            flash[:error] = "You Need to be an administrator to create new competitions"
            redirect_to season_path(params[:season_id])
        end
    end

    def show 
        @comp = Competition.find(params[:id])
        @seasons = Season.order(year: :desc)
    end

    def edit
        if admin_logged_in?
            @comp = Competition.find(params[:id])
        else
            flash[:error] = "You Need to be an administrator to edit a competition"
            redirect_to competition_path(params[:id])
        end
    end

   def update
        if admin_logged_in?
            @comp = Competition.find(params[:id])
            @comp.update(comp_params)
            if @comp.save
                redirect_to competition_path(@comp)
            else
                render :edit
            end
        else
            flash[:error] = "You Must be an Administrator to edit a competition"
            redirect_to competition_path(params[:id])
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

end