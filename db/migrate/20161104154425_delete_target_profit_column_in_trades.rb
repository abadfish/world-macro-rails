class DeleteTargetProfitColumnInTrades < ActiveRecord::Migration
  def change
    remove_column :trades, :target_profit
  end
end
