class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :user_id
      t.string :p_direction
      t.integer :aggregate_size
      t.string :p_product
      t.decimal :p_current_price
      t.decimal :aggregate_price
      t.decimal :gain_loss
      t.string :status, default: "open"

      t.timestamps null: false
    end
  end
end
