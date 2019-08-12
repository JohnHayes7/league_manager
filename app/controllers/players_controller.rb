class PlayersController < ApplicationController

    def create
        @player = Player.new(player_params)
        @player.team_id = params[:team_id]

        if @player.save

            redirect_to team_path(@player.team_id)
        end

    end

    def edit
        @player = Player.find(params[:id])
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
        
    end

    private

    def player_params
        params.require(:player).permit(:name, :jersey_number, :email, :phone_number)
    end

end