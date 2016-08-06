class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string :direction
      t.integer :size
      t.string :product
      t.date :trade_date
      t.decimal :price
      t.decimal :current_price
      t.integer :user_id
      t.string :status, default: "open"

      t.timestamps null: false
    end
  end
end
