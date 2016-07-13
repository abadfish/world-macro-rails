class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new

  end

  def create

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

  end

  def destroy
    @user = User.find(params[:id])

  end

  private

  def posts_params
    params.require(:post).permit(:title, :content, :date)
  end

end
