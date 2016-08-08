class AddColumnToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :p_current_price, :decimal
  end
end
