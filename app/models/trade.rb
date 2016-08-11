class Trade < ActiveRecord::Base
  belongs_to :position
  belongs_to :user
  validates :direction, presence: true

  before_create :update_current_prices

  def trader
    self.user.username
  end

  def self.update_current_prices
    data = TradeData.new
    self.all.each do |trade|
      current_price = data.get_current_price(trade.product)
      trade.update(current_price: current_price)
    end
  end

  def update_current_prices
    self.class.update_current_prices
  end

  def calculate_profit_or_loss
    if trade.direction.downcase = "buy"
      change = trade.current_price - trade.price
    elsif trade.direction.downcase = "sell"
      change = trade.price - trade.current_price
    end
    gain_loss = change * trade.size
    # need price per tick data from trade_data feed
  end
end
