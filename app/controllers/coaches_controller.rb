class CoachesController < ApplicationController

    def new
        @coach = Coach.new
    end

    def create
        coach = Coach.new(coach_params)
        if coach.save

            redirect_to coach_path(coach)
        else
            render :new
        end
    end

    def show
        if logged_in? && current_user.coach? || logged_in? && current_user.admin?
            @coach = Coach.find(params[:id])
        else
            redirect_to login_path 
            
        end  
    end


    private

    def coach_params
        params.require(:coach).permit(:name, :email, :phone_number, :password)
    end

end