class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :user_id
      t.integer :trade_id

      t.timestamps null: false
    end
  end
end
