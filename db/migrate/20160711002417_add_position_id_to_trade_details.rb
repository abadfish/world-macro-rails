class AddPositionIdToTradeDetails < ActiveRecord::Migration
  def change
    add_column :trade_details, :position_id, :integer
  end
end
