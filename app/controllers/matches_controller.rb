class MatchesController < ApplicationController

    def new
        @comp = Competition.find(params[:competition_id])
        @match = @comp.matches.build
    end

end