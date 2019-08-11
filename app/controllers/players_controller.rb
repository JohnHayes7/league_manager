class PlayersController < ApplicationController

    def create
        player = Player.new(player_params)
        player.team_id = params[:team_id]

        if player.save

            redirect_to team_path(player.team_id)
        end
    end

    def edit
        @player = Player.find(params[:id])
    end

    def update

    end

    private

    def player_params
        params.require(:player).permit(:name, :jersey_number, :email, :phone_number)
    end

end