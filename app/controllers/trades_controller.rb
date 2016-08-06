class TradesController < ApplicationController
  def show
    @trade = Trade.find(params[:id])
  end

  def index
    Trade.update_current_prices
    @trades = Trade.all
  end

  def new
    @trade = Trade.new
  end

  def create
    @trade = Trade.create(trade_params)
    redirect_to trade_path(@trade)
  end

  def edit
    @trade = Trade.find(params[:id])
  end

  def update
    @trade = Trade.find(params[:id])
  end

  def destroy
    @trade = Trade.find(params[:id])
    @trade.destroy
    flash[:notice] = "Position deleted."
    redirect_to trades_path
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
