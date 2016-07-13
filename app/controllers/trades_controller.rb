class TradesController < ApplicationController
  def show
    @trade = Trade.find(params[:id])
  end

  def index
    @trades = Trade.all
  end

  def new
    @trade = Trade.new
  end

  def create
    @trade = Trade.create(trade_params)
    redirect_to trade_params(@trade)
  end

  def edit
    @trade = Trade.find(params[:id])
  end

  def update
    @trade = Trade.find(params[:id])
  end

  def destroy

  end

  private

  def trade_params
    params.require(:trade).permit(
      :direction,
      :size,
      :product,
      :trade_date,
      :price,
      :current_price
    )
  end

end
