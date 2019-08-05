class MatchesController < ApplicationController

    def new
        @comp = Competition.find(params[:competition_id])
        @match = @comp.matches.build
        
    end

    def create
       @match = Match.new(match_params)
       @match.competition_id = params[:competition_id]
       if @match.save
            redirect_to competition_path(@match.competition_id)
       else
            # Need to add error Message
            render :new
       end
    end

    def show 

    end

    def edit
        
    end

    private

    def match_params
        params.require(:match).permit(:date, :time, :location_id, :competition_id, :referee_id, :location_notes, team_ids:[], location:[:name, :street_address, :city, :state, :zipcode])
    end

end