class ApplicationController < ActionController::Base
    include MatchesHelper


    helper_method :ref_logged_in?
    helper_method :coach_logged_in?
    helper_method :admin_logged_in?
    helper_method :belongs_to_ref

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

    def define_and_route(user)
        if  user.admin?
            session[:admin_id] = user.id
            redirect_to administrator_path(user)
            return

        elsif user.referee?
            session[:ref_id] = user.id
            redirect_to referee_path(user)
            return

        else 
            session[:coach_id] = user.id
            redirect_to coach_path(user)
            return
        end
    end

    def find_user_type(params)
        puts
        Administrator.find_by(email: params[:session][:email]) || @user = Referee.find_by(email: params[:session][:email]) || @user = Coach.find_by(email: params[:session][:email])
    end

    def admin_logged_in?
        logged_in? && current_user.admin?
    end

    def coach_logged_in?
        logged_in? && current_user.coach?
    end

    def ref_logged_in?
        logged_in? && current_user.referee?
    end

    def belongs_to_ref(match)
        match.referee_id == current_user.id
    end

    def logged_in_and_belongs_to_coach(coach)
        coach_logged_in? && current_user.id == coach.id
    end

end
