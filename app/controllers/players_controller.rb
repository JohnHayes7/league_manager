class PlayersController < ApplicationController

    def create
        @player = Player.new(player_params)
        @player.team_id = params[:team_id]

        if @player.save

            redirect_to team_path(@player.team_id)
        end

    end

    def new
        if admin_logged_in? || logged_in_and_belongs_to(@player.team.coach.id)
            @player = Player.new
        else
            flash[:error] = "You Must Be Logged In As An Administrator to add or create a player"
            redirect_to login_path
        end
    end

    def edit
        if admin_logged_in?
            @player = Player.find(params[:id])
        else
            flash[:error] = "You Must Be Logged In As An Administrator to add or create a player"
            redirect_to login_path
        end
    end 

    def update
        @player = Player.find(params[:id])
        @player.update(player_params) 
        if @player.save

            redirect_to team_path(@player.team_id)
        else
            render :edit
        end
    end

    def destroy
        
        @player = Player.find(params[:id])
        @player.destroy

        redirect_to team_path(params[:team_id])
    end

    private

    def player_params
        params.require(:player).permit(:name, :jersey_number, :email, :phone_number)
    end

end