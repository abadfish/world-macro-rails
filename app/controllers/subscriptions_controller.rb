class SubscriptionsController < ApplicationController

  def index
    @stripe_list = Stripe::Plan.all
    @plans = @stripe_list[:data]
  end

  def new
  end


end
