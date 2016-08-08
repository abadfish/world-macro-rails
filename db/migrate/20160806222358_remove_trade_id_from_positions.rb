class RemoveTradeIdFromPositions < ActiveRecord::Migration
  def change
    remove_column :positions, :trade_id
  end
end
