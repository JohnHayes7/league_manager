class ApplicationController < ActionController::Base

    def current_user=(user)
        binding.pry
        @current_user = user
    end

    def current_user
        @current_user
    end

    def logged_in?
        current_user != nil
    end
end
