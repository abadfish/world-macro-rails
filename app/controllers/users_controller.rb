class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.insights.build()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    unless authorize @user
      redirect_to users_path, alert: "Access denied."
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    authorize @user
    redirect_to user_path(@user)
  end

  def insights_index
    @user = Contributor.find(params :id)
    @insights = @user.insights
    render template: 'insights/index'
  end

  def insight
   @user = User.find(params[:id])
   @insight = Insight.find(params[:insight_id])
   render template: 'insights/show'
 end

  private

  def user_params
    params.require(:user).permit(:role, :insights_attributes =>[
      :title, :content, :contributor_id])
  end

end
