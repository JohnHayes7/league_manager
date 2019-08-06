class RefereesController < ApplicationController 

    def new
        @ref = Referee.new
    end

    def create
        ref = Referee.new(ref_params)
        if ref.save

            redirect_to referee_path(ref)
        else
            flash[:error] = "All fields required to create a new referee account"
            render :new
        end
    end

    def show
        @ref = Referee.find(params[:id])
        @matches = Match.where(:referee_id == 1)
    end




    private

    def ref_params
        params.require(:referee).permit(:name, :email, :phone, :password)
    end

end