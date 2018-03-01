class UsersController < ApplicationController
  before_action :authorize, only: [:show]

  def index
    @users = User.all
  end

  def show
     @user = User.find(params[:id])
    #  @posts = Post.all
  end

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path 
    else
      redirect_to new_user_path
  end

  def edit
    @user = User.find(params[:id])
    end

  def update
  end

  def destroy
  end
  
  
end


private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  end