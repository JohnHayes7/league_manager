class CoachesController < ApplicationController

    def new
        if admin_logged_in?
            @coach = Coach.new
        else
            redirect_to login_path
        end
    end

    def create
        @coach = Coach.new(coach_params)
        if @coach.save

            redirect_to coach_path(@coach)
        else
            render :new
        end
    end

    def show
        if coach_logged_in? || admin_logged_in?
            @coach = Coach.find(params[:id])
            @unassigned_teams = Team.where("coach_id == 5")
        else
            flash[:error] = "You Must be logged in to continue"
            redirect_to login_path 
            
        end  
    end

    def edit
        if coach_logged_in?? && current_user.id == @coach.id || admin_logged_in?
            @coach = Coach.find(params[:id])
        else
            flash[:error] = "Coaches can only edit their own infomation.  Or you must be logged in as an administrator"
            redirect_to coach_path(@coach)
        end 
    end

    def update
        @coach = Coach.find(params[:id])
        @coach.update(coach_params)
        if @coach.save

            redirect_to coach_path(@coach)
        end
    end

    def destroy
        @coach = Coach.find(params[:id])
        @coach.reassign_coach_teams
        
        @coach.destroy

        redirect_to administrator_path(current_user.id)
    end


    private

    def coach_params
        params.require(:coach).permit(:name, :email, :phone_number, :password)
    end

end