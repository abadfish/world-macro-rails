class AddStrategyCurrentPxToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :strategy_current_px, :decimal
  end
end
