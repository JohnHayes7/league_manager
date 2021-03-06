class MatchesController < ApplicationController
    before_action :admin_login, except: [:show]



    def new
         @comp = Competition.find(params[:competition_id])
         @match = @comp.matches.build
    end

    def create
        @match = Match.new(match_params)
        @match.competition_id = params[:competition_id]
        if @match.teams_count_valid?(params[:match][:team_ids].count)
                if @match.save
                        redirect_to competition_path(@match.competition_id)
                else
                        flash[:error] = "Match could not be saved. Please try again."
                        render :new
                end
        else
            flash[:error] = "Be sure two teams are selected to create a match"
            render :new
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
        Match.destroy(params[:id])
    end

    def assign
        @match = Match.find(params[:id])
        @match.assign_ref(params[:referee_id])
    
       redirect_to referee_path(@match.referee_id)
    end

    def unassign
        @match = Match.find(params[:id])
        origin_ref_id = params[:referee_id]
        @match.unassign_ref

        redirect_to referee_path(origin_ref_id)
    end

    

    private

    def match_params
        params.require(:match).permit(:date, :time, :location_id,  :referee_id, :location_notes, team_ids:[], location:[:name, :street_address, :city, :state, :zip_code])
    end

    def admin_login
        unless admin_logged_in?
            flash[:error] = "You must be an administrator to continue"
            redirect_to login_path
        end
    end

end