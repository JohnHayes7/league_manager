class RefereesController < ApplicationController 

    def new
        @ref = Referee.new
    end

end