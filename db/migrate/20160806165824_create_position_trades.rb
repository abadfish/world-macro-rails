class CreatePositionTrades < ActiveRecord::Migration
  def change
    create_table :position_trades do |t|
      t.integer :position_id
      t.integer :trade_id

      t.timestamps null: false
    end
  end
end
