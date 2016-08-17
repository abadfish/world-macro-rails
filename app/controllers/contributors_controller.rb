class ContributorsController < ApplicationController
  def show
    @contributor = Contributor.find(params[:id])
  end

  def index
    @contributors = Contributor.all
  end

  def new
    @contributor = Contributor.new
    @contributor.insights.build()
    @contributor.insights.build()
  end

  def create
    @contributor = Contributor.create(contributor_params)
    redirect_to contributor_path(@contributor)
  end

  def insights_index
    @contributor = Contributor.find(params :id)
    @insights = @contributor.insights
    render template: 'insights/index'
  end

  def insight
   @contributor = Contributor.find(params[:id])
   @insight = Insight.find(params[:insight_id])
   render template: 'insights/show'
 end

  private

  def contributor_params
    params.require(:contributor).permit(:username, :email, :insights_attributes =>[
      :title, :content, :contributor_id]
        )
  end
end
