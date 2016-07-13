class TradeDetail < ActiveRecord::Base
  belongs_to :position
  belongs_to :user

  def trader
    self.user.username
  end

  def self.update_current_prices
    data = TradeData.new
    self.all.each do |trade|
      current_price = data.get_current_price(@position.trade_details.product)
      trade.update(current_price: current_price)
    end
  end
end
