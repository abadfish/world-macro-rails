class AddPositionIdToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :position_id, :integer
  end
end
