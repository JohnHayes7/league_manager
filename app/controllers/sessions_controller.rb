class SessionsController < ApplicationController

    def new
       
    end

    def create
       @user = Administrator.find_by(email: params[:session][:email]) || @user = Referee.find_by(email: params[:session][:email]) || @user = Coach.find_by(email: params[:session][:email])
       if @user && @user.authenticate(params[:session][:password])
            if @user.admin?
                session[:admin_id] = @user.id
                redirect_to administrator_path(@user)
                return

            elsif @user.referee?
                session[:ref_id] = @user.id
                redirect_to referee_path(@user)
                return

            else 
                session[:coach_id] = @user.id
                redirect_to coach_path(@user)
                return
            end
       else
            render :new
       end
    end

    def destroy
        session.clear

        redirect_to root_path   
    end

    def omniauth
        @user = Administrator.from_omniauth(auth)
        @user.save
        if @user 
            if @user.admin?
                session[:admin_id] = @user.id
                redirect_to administrator_path(@user)
                return

            elsif @user.referee?
                session[:ref_id] = @user.id
                redirect_to referee_path(@user)
                return

            else 
                session[:coach_id] = @user.id
                redirect_to coach_path(@user)
                return
            end
       else
            render :new
       end
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end