class AddStatusColumnToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :status, :string, default: "open"
  end
end
