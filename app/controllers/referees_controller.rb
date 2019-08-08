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
        if logged_in? && current_user.referee? || logged_in? && current_user.admin?
            @ref = Referee.find(params[:id])
            # referee_id: 1 is the id of "No Referee assigned to this match"
            # @matches is a list of unassigned matches referees can pick from
            @matches = Match.where("referee_id = 1")
        else
            redirect_to login_path
        end
        
    end




    private

    def ref_params
        params.require(:referee).permit(:name, :email, :phone, :password)
    end

end