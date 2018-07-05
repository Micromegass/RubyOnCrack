class UsersController < ApplicationController

    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Successfully created Useraccount. Please log in now..."
            redirect_to root_path
        else
            flash[:danger] = "Ups, an error occured. Please try again."
            render :new
        end
    end

    private
    def user_params
      params.require(:user).permit(:email, :password, :name, :username)
    end

end
