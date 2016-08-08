class AddColumnsToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :p_direction, :string
    add_column :positions, :aggregate_size, :integer
    add_column :positions, :p_product, :string
    add_column :positions, :aggregate_price, :decimal
    add_column :positions, :gain_loss, :decimal
  end
end
