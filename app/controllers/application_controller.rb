class ApplicationController < ActionController::Base

    def current_user=(user)
        if user.admin?
            @current_user ||= Administrator.find(session[:user_id])
        elsif user.referee?
            @current_user ||= Referee.find(session[:user_id])
        else
            @current_user ||= Coach.find(session[:user_id])
        end
    end

    def current_user
        @current_user
    end

    def logged_in?
        current_user != nil
    end
end
