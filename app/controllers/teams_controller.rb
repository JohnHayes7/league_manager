class TeamsController < ApplicationController
    def new
        @team = Team.new
    end

    def create
        team = Team.new(team_params)
        if team.save
            redirect_to teams_path
        else
            render :new
        end
    end

    def index
        @teams = Team.all
    end

    def show
        @team = Team.find(params[:id])
    end

    def update
        @team = Team.find(params[:id])
        @team.coach_id = params[:team][:coach_id]
        @team.save

        redirect_to team_path(@team)
    end

    private
    
    def team_params
        params.require(:team).permit(:name, :coach)
    end
end