class ChangeDecimalsToIntegersInTrades < ActiveRecord::Migration
  def change
    change_column :trades, :target_profit, :integer
    change_column :trades, :realized, :integer
  end
end
