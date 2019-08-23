class AdministratorsController < ApplicationController
    before_action :admin_login, except: [:index, :edit]

    def index
        @admins = Administrator.order(:name)
    end

    def new
        @admin = Administrator.new
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
        @admin = Administrator.find_by(:id => params[:id])
        @teams = Team.order(:name)
        @coaches = Coach.order(:name)
        @seasons = Season.order(year: :desc)
        @referees = Referee.order(:name)
    end

    def edit
        @admin = Administrator.find(params[:id])
        if admin_logged_in? && current_user.id == @admin.id
            render :edit
        else
            flash[:error] = "You must be an administrator.  You can only edit your own information"
            redirect_to login_path
        end
    end

    def destroy
        @admin = Administrator.find(params[:id])
        @admin.destroy
        redirect_to administrators_path
    end

    

    private

    def admin_params
        params.require(:administrator).permit(:name, :email, :password)
    end

    def admin_login
        unless admin_logged_in?
            flash[:error] = "You must be an administrator to continue"
            redirect_to login_path
        end
    end
    
end