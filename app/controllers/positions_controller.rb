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
    @position = Position.create(position_params)
    redirect_to position_path(@position)
  end

  def edit
    @position = Position.find(params[:id])
  end

  def update
    @position = Position.find(params[:id])
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy
    flash[:notice] = "Position deleted."
    redirect_to positions_path
  end

  private

  def position_params(*args)
    params.require(:position).permit(:title, :status, trade_details_attributes: [
      :direction,
      :size,
      :product,
      :trade_date,
      :price
    ]
    )
  end


end
