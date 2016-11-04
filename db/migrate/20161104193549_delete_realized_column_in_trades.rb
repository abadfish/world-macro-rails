class DeleteRealizedColumnInTrades < ActiveRecord::Migration
  def change
    remove_column :trades, :realized
  end
end
