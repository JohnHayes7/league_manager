class CompetitionsController < ApplicationController

    def create
        @comp = Competition.create(comp_params)

    end

    def show 
        raise params.inspect
        if params[:season_id]
            @comps = Season.find(:id => params[:season_id]).competitions
           
        end
    end

    private

    def comp_params
        params.require(:competition).permit(:name)
    end

end