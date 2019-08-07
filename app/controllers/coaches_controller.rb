class CoachesController < ApplicationController

    def new
        @coach = Coach.new
    end

end