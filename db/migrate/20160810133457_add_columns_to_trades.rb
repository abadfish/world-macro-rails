class AddColumnsToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :option_strategy, :string
    add_column :trades, :strategy_price, :decimal
  end
end
