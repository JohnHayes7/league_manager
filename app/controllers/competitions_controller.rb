class CompetitionsController < ApplicationController
    
    def new
        
        @season = Season.find(params[:season_id])
    end

    def create
        if admin_logged_in?
            @comp = Competition.new(comp_params)
            @comp.season_id = params[:season_id]
            if @comp.save
                
                redirect_to season_path(params[:season_id])
            end
        else
            flash[:error] = "You Need to be an administrator to create new competitions"
            redirect_to season_path(params[:season_id])
        end
    end

    def show 
        @comp = Competition.find(params[:id])
        @seasons = Season.all
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

    private

    def comp_params
        params.require(:competition).permit(:name)
    end

end