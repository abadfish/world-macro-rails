class InsightsController < ApplicationController

  def index
    if params[:contributor_id]
      @insights = Contributor.find(params[:contributor_id]).insights
    else
      @insights = Insight.all
    end
  end

  def show
    if params[:contributor_id]
      @post = Insight.find(params[:id])
    else
      @post = Insight.find(params[:id])
    end
  end
end
