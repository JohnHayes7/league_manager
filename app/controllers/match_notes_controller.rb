class MatchNotesController < ApplicationController

    def new
        @match = Match.find(params[:match_id])
        if ref_logged_in? && belongs_to_ref(@match)
            @note = MatchNote.new
            @ref = Referee.find(params[:referee_id])
        else
            flash[:error] = "Only the Referee who officiated this game can add match notes"
            redirect_to login_path
        end
        
    end

    def create
        match = Match.find(params[:match_note][:match_id])
        if ref_logged_in? && belongs_to_ref(match)
            note = MatchNote.new(match_note_params)
            note.referee_id = params[:referee_id]
            note.match_id = match.id
            match.goals_update(params)
            if note.save

                redirect_to competition_match_path(match.competition_id, match)
            end
        else
            flash[:error] = "Only the Referee who officiated this game can add match notes"
            redirect_to login_path
        end
    end

    def edit
        @match = Match.find(params[:match_id])
        @comp = Competition.find(@match.competition_id)
        if ref_logged_in? && belongs_to_ref(@match)
            @note = MatchNote.find(params[:id])
            @ref = Referee.find(params[:referee_id])
        else
            flash[:error] = "Only the Referee who officiated this game can edit match notes"
            redirect_to competition_match_path(@match.competition_id, @match)
        end
    end

    def update
        @match = Match.find(params[:match_id])
        if ref_logged_in? && belongs_to_ref(@match)
            @note = MatchNote.find(params[:id])
            @match.goals_update(params)
            @note.match_id = @match.id
            @note.update(match_note_params)
            
            @note.save

            redirect_to competition_match_path(@match.competition_id, @match)
        else
            flash[:error] = "Only the Referee who officiated this game can edit match notes"
            redirect_to competition_match_path(@match.competition_id, @match)
        end
    end
    

    private

    def match_note_params
        params.require(:match_note).permit(:match_id, :content)
    end

end