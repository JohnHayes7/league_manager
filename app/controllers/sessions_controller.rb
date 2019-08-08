class SessionsController < ApplicationController

    def new
       
    end

    def create
       @user = Administrator.find_by(email: params[:session][:email]) || @user = Referee.find_by(email: params[:session][:email]) || @user = Coach.find_by(email: params[:session][:email])
        
       if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            if @user.admin?
                redirect_to administrator_path(@user)

            elsif @user.referee?
                redirect_to referee_path(@user)

            else 
                redirect_to coach_path(@user)
            end
       else

            render :new
       end

       
    end

end