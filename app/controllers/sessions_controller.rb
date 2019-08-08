class SessionsController < ApplicationController

    def new
       
    end

    def create
       @user = Administrator.find(params[:session][:email])
       
    end

end