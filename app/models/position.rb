class Position < ActiveRecord::Base
  has_many :trades

  def self.open_positions
    where("status = 'open'")
  end

  # write a method to calculate gain_loss
  def get_position_current_price
    # doesn't work yet
    position = Position.find(position_id)
    p_current_price = position.trades.first.current_price
  end
end
