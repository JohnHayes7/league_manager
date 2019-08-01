class CompetitionsController < ApplicationController

    def create
        @comp = Competition.create(comp_params)

    end

    def show 
        @comp = Competition.find(params[:id])
    end

    private

    def comp_params
        params.require(:competition).permit(:name)
    end

end