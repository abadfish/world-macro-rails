class AddTargetProfitToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :target_profit, :integer
  end
end
