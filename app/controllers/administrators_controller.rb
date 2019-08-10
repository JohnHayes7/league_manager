class AdministratorsController < ApplicationController

    
    def create
       @admin = Administrator.new(admin_params)
       if @admin.save

          redirect_to administrator_path(@admin)
       else
          render :new
       end
    end

    def show
        if logged_in? && current_user.admin?
            @admin = Administrator.find_by(:id => params[:id])
            @teams = Team.all
            @coaches = Coach.all
            @seasons = Season.all
        else
            redirect_to login_path
        end
        
    end

    def new
        @admin = Administrator.new
    end

    private

    def admin_params
        params.require(:administrator).permit(:name, :email, :password)
    end
    
end