class SessionsController < ApplicationController

    def new
       
    end

    def create
       @user = find_user_type(params)
       if @user && @user.authenticate(params[:session][:password])
            define_and_route(@user)
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
            define_and_route(@user)
       else
            render :new
       end
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end