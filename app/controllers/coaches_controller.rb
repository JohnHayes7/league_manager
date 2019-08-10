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

    def edit
        @coach = Coach.find(params[:id])
        if !logged_in? && current_user.coach? && current_user.id == @coach.id || !logged_in? && current_user.admin?
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
        @coach.teams.each do |t|
            t.coach_id = 5
            t.save
        end
        @coach.destroy

        redirect_to administrator_path(current_user.id)
    end


    private

    def coach_params
        params.require(:coach).permit(:name, :email, :phone_number, :password)
    end

end