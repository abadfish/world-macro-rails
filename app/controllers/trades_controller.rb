class TradesController < ApplicationController
  require 'csv'

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
    @trade = Trade.new(trade_params)
    @trade.user_id = current_user.id
    @trade.save
    redirect_to trades_path
  end

  def upload
    CSV.foreach(params[:file].path, headers: false, encoding:'iso-8859-1:utf-8', :col_sep => ";", :quote_char => "\x00") do |trade|
      Trade.create(status: trade[0],
      product_type: trade[1],
      trade_date: trade[2],
      direction: trade[3],
      size: trade[4],
      product: trade[5],
      price: trade[6],
      target: trade[8],
      stop: trade[9],
      tick_value: trade[10],
      risk: trade[11],
      target_profit: trade[12],
      realized: trade[13],
      exit_date: trade[14],
      exit_price: trade[15],
      currency: trade[16],
      rate_at_close: trade[17],
      p_and_l_usd: trade[18],
      category: trade[19])
    end
    redirect_to trades_path
  end

  def edit
    @trade = Trade.find(params[:id])
  end

  def update
    @trade = Trade.find(params[:id])
    @trade.update(trade_params)
    redirect_to trades_path
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
      :status,
      :product_type,
      :direction,
      :size,
      :product,
      :price,
      :current_price,
      :trade_date,
      :target,
      :stop,
      :tick_value,
      :risk,
      :target_profit,
      :realized,
      :exit_date,
      :exit_price,
      :currency,
      :rate_at_close,
      :p_and_l_usd,
      :category
    )
  end

  def product_in_positions?(product)
    @positions = Position.all
    @positions.open_positions.select do |p|
      p.p_product = product
    end
  end

  def adjust_position(trade)
    @position = Position.find(trade.position_id)
    if @trade.direction.downcase == "buy"
      @position.aggregate_size += @trade.size
    else
      @position.aggregate_size -= @trade.size
    end
    (@position.aggregate_price += @trade.price)/@position.aggregate_size
    @position.p_current_price = @trade.current_price
    @position.save
  end
end
