class AdministratorsController < ApplicationController

    def index
        @admins = Administrator.all
    end
    
    def create
       @admin = Administrator.new(admin_params)
       if @admin.save

          redirect_to administrator_path(@admin)
       else
          render :new
       end
    end

    def show
        if admin_logged_in?
            @admin = Administrator.find_by(:id => params[:id])
            @teams = Team.all
            @coaches = Coach.all
            @seasons = Season.all
            @referees = Referee.all
        else
            redirect_to login_path
        end
        
    end

    def new
        @admin = Administrator.new
    end

    def edit
        @admin = Administrator.find(params[:id])
        if admin_logged_in? && current_user.id == @admin.id
            render :edit
        else
            redirect_to login_path
        end
    end

    def destroy
        @admin = Administrator.find(params[:id])
        if admin_logged_in?
            @admin.destroy

            redirect_to administrators_path
        else
            redirect_to login_path
        end
    end

    private

    def admin_params
        params.require(:administrator).permit(:name, :email, :password)
    end
    
end