class CompetitionsController < ApplicationController
    

    def create
        @comp = Competition.new(comp_params)
        @comp.season_id = params[:season_id]
        if @comp.save
            
            redirect_to season_path(params[:season_id])
        end
    end

    def show 
        @comp = Competition.find(params[:id])
        
    end

    def new
        @season = Season.find(params[:season_id])
        @comp = Competition.new
        @comp.matches.build
    end

    # def patch
    #     raise params.inspect
    # end

    private

    def comp_params
        params.require(:competition).permit(:name)
    end

end