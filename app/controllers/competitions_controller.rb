class CompetitionsController < ApplicationController

    def create
        @comp = Competition.create(comp_params)

    end

    def show 
        if params[:season_id]
            comps = Season.find(params[:season_id]).competitions 
            @comp = comps.find(params[:id]) 
        end
    end

    private

    def comp_params
        params.require(:competition).permit(:name)
    end

end