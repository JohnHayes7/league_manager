class MatchesController < ApplicationController

    def new
        @comp = Competition.find(params[:competition_id])
        @match = @comp.matches.build
    end

    def create
        match = Match.new(match_params)
        if match.save
            redirect_to match_path(match)
        end
    end

    private

    def match_params
        params.require(:match).permit(:date, :location_id, :location_notes, location:[:name, :street_address, :city, :state, :zipcode])
    end

end