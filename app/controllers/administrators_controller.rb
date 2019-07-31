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
        @admin = Administrator.where(:id => params[:id])
        
    end

    def new
        @admin = Administrator.new
    end

    private

    def admin_params
        params.require(:administrator).permit(:name, :email, :password)
    end
    
end