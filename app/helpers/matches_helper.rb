module MatchesHelper

    def homepage
        if ref_logged_in?
            link_to "Homepage", referee_path(current_user.id)
        elsif admin_logged_in?
            link_to "Homepage", administrator_path(current_user.id)
        elsif coach_logged_in?
            link_to "Homepage", coach_path(current_user.id)
        end
    end
end