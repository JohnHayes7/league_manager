class CompetitionsController < ApplicationController
    

    def create
        if name.valid?
            @comp = Competition.create(comp_params)
        end
    end

    def show 
        @comp = Competition.find(params[:id])
        
    end

    def new
        raise params.inspect
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