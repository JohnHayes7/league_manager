class MatchNotesController < ApplicationController

    def new
        @note = MatchNote.new
        @ref = Referee.find(params[:referee_id])
    end

    def create
        note = MatchNote.new(match_note_params)
        match = Match.find(params[:match_note][:match_id])
        if note.save

            redirect_to competition_match_path(match.competition_id, match)
        end
    end

    private

    def match_note_params
        params.require(:match_note).permit(:match_id, :content)
    end

end