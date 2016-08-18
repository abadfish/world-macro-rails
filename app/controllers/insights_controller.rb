class InsightsController < ApplicationController

  def new
    @user = current_user
    current_user.insights.build
  end

  def create
    render :insights
  end

  def index
    if params[:user_id]
      @insights = User.find(params[:user_id]).insights
    else
      @insights = Insight.all
    end
  end

  def show
    if params[:user_id]
      @insight = Insight.find(params[:id])
    else
      @insight = Insight.find(params[:id])
    end
  end
end
