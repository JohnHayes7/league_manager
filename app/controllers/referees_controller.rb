class RefereesController < ApplicationController 

    def new
        @ref = Referee.new
    end

    def create
        @ref = Referee.new(ref_params)
        if @ref.save

            redirect_to referee_path(@ref)
        else
           
            render :new
        end
    end

    def show
        if logged_in? && current_user.referee? || logged_in? && current_user.admin?
            @ref = Referee.find(params[:id])
            @unassigned_matches = Match.unassigned
        else
            redirect_to login_path
        end
        
    end




    private

    def ref_params
        params.require(:referee).permit(:name, :email, :phone, :password)
    end

end