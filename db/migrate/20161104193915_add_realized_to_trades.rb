class AddRealizedToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :realized, :integer
  end
end
