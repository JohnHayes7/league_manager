class RefereesController < ApplicationController 

    def new
        if admin_logged_in?
            @ref = Referee.new
        else
            flash[:error] = "You must be an Administrator to create a new referee account"
        end
    end

    def create
        @ref = Referee.new(ref_params)
        if @ref.save

            redirect_to referee_path(@ref)
        else
            flash[:error] = "Account Could Not Be Created. Please verify information"
            render :new
        end
    end

    def show
        if ref_logged_in? || admin_logged_in?
            @ref = Referee.find(params[:id])
            @unassigned_matches = Match.unassigned
        else
            flash[:error] = "You Must Be Logged In As A Referee or Administrator To View This Page"
            redirect_to login_path
        end
    end

    def edit
        if ref_logged_in? && current_user.id == params[:id] || admin_logged_in?
            @ref = Referee.find(params[:id])
        else
            flash[:error] = "Referee's can only edit their own information Or You Must an Administrator to edit referee."
            redirect_to login_path
        end
    end

    def update
        @ref = Referee.find(params[:id])
        @ref.update(ref_params)
        @ref.save
        redirect_to referee_path(@ref)
    end




    private

    def ref_params
        params.require(:referee).permit(:name, :email, :phone, :password)
    end

end