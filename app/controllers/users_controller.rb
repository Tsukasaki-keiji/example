class UsersController < ApplicationController
  def index
    @users = User.all
    @blogs = Blog.all
    @blog = Blog.new
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs
    @blog = Blog.new
  end

  def edit
    @user = User.find(params[:id])
    @blogs = Blog.all
    if @user != User.find(current_user.id)
      redirect_to user_path(current_user)
    end
  end

  def top
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:blog)
  end
end
