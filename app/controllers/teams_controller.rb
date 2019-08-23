class TeamsController < ApplicationController

    before_action :admin_login, except: [:show, :index, :update]
    
    def new
        @team = Team.new
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
        team = Team.find(params[:id])
        team.lose_coach
        team.destroy

        redirect_to administrator_path(current_user.id)
    end


    private
    
    def team_params
        params.require(:team).permit(:name, :coach_id)
    end

    def admin_login
        unless admin_logged_in?
            flash[:error] = "You must be an administrator to continue"
            redirect_to login_path
        end
    end
end