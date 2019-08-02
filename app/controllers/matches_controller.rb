class MatchesController < ApplicationController

    # def new
    #     @comp = Competition.find(params[:competition_id])
    #     @match = @comp.matches.build
        
    # end

    # def create
    #     match = Match.new(match_params)
    #     binding.pry
    #     if match.save
    
    #         redirect_to controller_match_path(match)
    #     end
    #     render :new
    # end

    def show 

    end

    private

    def match_params
        params.require(:match).permit(:date, :location_notes, location:[:name, :street_address, :city, :state, :zipcode])
    end

end