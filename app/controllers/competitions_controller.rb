class CompetitionsController < ApplicationController

    def create
        @comp = Competition.create(comp_params)

    end

    def show 

    end

    private

    def comp_params
        params.require(:competition).permit(:name)
    end

end