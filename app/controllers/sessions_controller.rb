class SessionsController < ApplicationController

    def new
       
    end

    def create
       
       @user = Administrator.find_by(email: params[:session][:email]) || @user = Referee.find_by(email: params[:session][:email]) || @user = Coach.find_by(email: params[:session][:email])
       
       if @user && @user.authenticate(params[:session][:password])
            if @user.admin?
                session[:admin_id] = @user.id
                redirect_to administrator_path(@user)

            elsif @user.referee?
                session[:ref_id] = @user.id
                redirect_to referee_path(@user)

            else 
                session[:coach_id] = @user.id
                redirect_to coach_path(@user)
            end
       else

            render :new
       end

       
    end

end