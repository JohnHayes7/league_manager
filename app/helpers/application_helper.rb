module ApplicationHelper

    def current_user
        if session[:admin_id]
            @current_user ||= Administrator.find(session[:admin_id])
        elsif session[:ref_id]
            @current_user ||= Referee.find(session[:ref_id])
        elsif session[:coach_id]
            @current_user ||= Coach.find(session[:coach_id])
        else
            nil
        end
    end

    def logged_in?
        current_user != nil
    end
end
