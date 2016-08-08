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
    @trade = Trade.new(trade_params)
    @trade.user_id = current_user.id
    if product_in_positions?(@trade.product) == []
      @position = Position.new
      @position.p_direction = @trade.direction
      @position.aggregate_size = @trade.size
      @position.p_product = @trade.product
      @position.aggregate_price = @trade.price
      @position.p_current_price = @trade.current_price
      @position.user_id = @trade.user_id
      @position.save
      @position.id = @trade.position_id
      @trade.save
    else
      @position = Position.find_by(p_product: @trade.product)
      @trade.position_id = @position.id
      @trade.save
      adjust_position(@trade)
    end
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
      :current_price,
      :user_id
    )
  end

  def product_in_positions?(product)
    @positions = Position.all
    @positions.open_positions.select do |p|
      p.p_product.try(product)
    end
  end

  def adjust_position(trade)
    @position = Position.find(trade.position_id)
    if @trade.direction.downcase == "buy"
      @position.aggregate_size += @trade.size
    else
      @position.aggregate_size -= @trade.size
    end
    @position.aggregate_price = @trade.price/@position.size
    @position.p_current_price = @trade.current_price
    @position.save
  end
end
