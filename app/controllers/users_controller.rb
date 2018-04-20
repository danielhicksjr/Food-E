class UsersController < ApplicationController
  before_action :authorize, only: [:show]
  
  

  def index
    @users = User.all
  end

  def show
     @user = User.find(params[:id])
   
  end

  
  def new
    @user = User.new 
  end

  
  def create
        @user = User.new(user_params)
    if @user.save
        flash[:success] = "You have successfully created an account."
        redirect_to new_session_path 
    else
        flash[:danger] = "Please check to ensure all fields are correct."
        redirect_to new_user_path
  end
end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end
  
  



private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  end