class TeamsController < ApplicationController
    def new
        if admin_logged_in?
            @team = Team.new
        else
            flash[:error] = "You must be logged in to create a new team"
            redirect_to login_path
        end
    end

    def create
        @team = Team.new(team_params)
        if @team.save
            redirect_to teams_path
        else
            render :new
        end
    end

    def index
        @teams = Team.order(:name)
    end

    def show
        @team = Team.find(params[:id])
        @player = @team.players.build
    end

    def update
        if admin_logged_in? || coach_logged_in? && current_user.id == params[:team][:coach_id]
            @team = Team.find(params[:id])
            @team.coach_id = params[:team][:coach_id]
            @team.save
            
            redirect_to team_path(@team)
        else
            flash[:error] = "Only an administrator or the teams coach can edit a team"
            redirect_to login_path
        end
    end

    def destroy
        if admin_logged_in?
            team = Team.find(params[:id])
            team.lose_coach
            team.destroy

            redirect_to administrator_path(current_user.id)
        else
            flash[:error] = "Only an Administrator can delete a team"
            redirect_to login_path
        end
    end


    private
    
    def team_params
        params.require(:team).permit(:name, :coach_id)
    end
end