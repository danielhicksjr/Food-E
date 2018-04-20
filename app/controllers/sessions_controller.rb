class SessionsController < ApplicationController
  def new
    p session[:user_id]
  end

  def create
      @user = User.find_by_email(params[:email])
   if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Welcome, #{@user.name}."
        redirect_to posts_path
   else 
        flash[:danger] = "The information provided is incorrect. Please try again."
        redirect_to new_session_path
   end

  end

  def destroy
        session[:user_id] = nil
        flash[:success] = "You have successfully signed out."
        redirect_to root_path
  end
end
