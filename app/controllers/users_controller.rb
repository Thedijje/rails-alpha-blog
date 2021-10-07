class UsersController < ApplicationController

    def new
        @users  =   User.new
        render 'new'
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice]="Welcome to Alpha blog #{@user.username}, signup succesful"
            redirect_to articles_path
        else
            flash[:errors]   =   @user.errors.full_messages;
            redirect_to signup_path
        end

    end


    private 

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
