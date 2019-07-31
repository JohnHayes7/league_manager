class AdministratorsController < ApplicationController

    def show

    end

    def create

    end

    def new
        @admin = Administrator.new
    end

    private

    def admin_params
        params.require(:administrator).permit(:name, :email, :password)
    end
    
end