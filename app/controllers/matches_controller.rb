class MatchesController < ApplicationController

    def new
        @comp = Competition.find(params[:competition_id])
        @match = @comp.matches.build
        
    end

    def create
       
       if params[:match][:team_ids].count == 3 
            @match = Match.new(match_params)
            @match.competition_id = params[:competition_id]
            
                if @match.save
                        redirect_to competition_path(@match.competition_id)
                else
                        # Need to add error Message
                        render :new
                end
        else
            flash[:error] = "Be sure two teams are selected to create a match"
            redirect_to new_competition_match_path
        end
    end

    def show
        @match = Match.find(params[:id])

    end

    def edit
        @match = Match.find(params[:id])
    end

    def update
        @match = Match.find(params[:id])
        @match.update(match_params)
        if @match.save
            redirect_to competition_path(@match.competition_id)
        else
            render :edit
        end
    end

    def destroy
        if logged_in? && current_user.admin?
            Match.destroy(params[:id])

            redirect_to competition_path
        end
    end

    def assign
       @match = Match.find(params[:id])
       @match.referee_id = params[:referee_id]
       @match.save

       redirect_to referee_path(@match.referee_id)
    end

    def unassign
        @match = Match.find(params[:id])
        @ref = Referee.find(params[:referee_id])
        @match.referee_id = 1
        @match.save

        redirect_to referee_path(@ref)
    end

    private

    def match_params
        params.require(:match).permit(:date, :time, :location_id,  :referee_id, :location_notes, team_ids:[], location:[:name, :street_address, :city, :state, :zipcode])
    end

end