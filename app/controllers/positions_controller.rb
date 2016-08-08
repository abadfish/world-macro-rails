class PositionsController < ApplicationController

  def show
    @position = Position.find(params[:id])
  end

  def index
    @positions = Position.all
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new
    @position.p_direction = @trade.direction
    @position.aggregate_size = @trade.size
    @position.p_product = @trade.product
    @position.aggregate_price = @trade.price
    @position.p_current_price = @trade.current_price
    @position.user_id = @trade.user_id
    @position.save
    redirect_to position_path(@position)
  end

  def edit
    @position = Position.find(params[:id])

  end

  def update
    @position = Position.find(params[:id])
    @position.update(position_params)
    redirect_to position_path(@position)
  end

  def destroy
    @position = Position.find(params[:id])
    @position.status = "closed"
    @position.save
    @position.destroy
    flash[:notice] = "Position deleted."
    redirect_to positions_path
  end

  private

  def position_params(*args)
    params.require(:position).permit(:p_direction, :aggregate_size, :p_product, :aggregate_price, :p_current_price, :gain_loss
    )
  end




end
