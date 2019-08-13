class MatchNotesController < ApplicationController

    def new
        @note = MatchNote.new
        @ref = Referee.find(params[:referee_id])
    end

    def create
       
        note = MatchNote.new(match_note_params)
        note.referee_id = params[:referee_id]
        match = Match.find(params[:match_note][:match_id])
        if note.save

            redirect_to competition_match_path(match.competition_id, match)
        end
    end

    def edit
        @match = Match.find(params[:match_id])
        @comp = Competition.find(@match.competition_id)
        if ref_logged_in? && @match.belongs_to_ref
            @note = MatchNote.find(params[:id])
            @ref = Referee.find(params[:referee_id])
        else
            redirect_to competition_match_path(@match.competition_id, @match)
        end
    end

    def update
        @match = Match.find(params[:match_id])
        @note = MatchNote.find(params[:id])
        @note.update(match_note_params)
        @note.save

        redirect_to competition_match_path(@match.competition_id, @match)
    end
    

    private

    def match_note_params
        params.require(:match_note).permit(:match_id, :content)
    end

end