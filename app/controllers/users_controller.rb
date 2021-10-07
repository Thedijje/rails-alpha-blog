class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user  =   User.new
        render 'new'
    end


    def show
        @user = User.find(params[:id])
        @articles = @user.articles
    end


    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice]  =   "Account info updated"
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice]="Welcome to Alpha blog #{@user.username}, signup succesful"
            redirect_to user_path(@user)
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
