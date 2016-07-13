class RenameTradesToTradeDetails < ActiveRecord::Migration
  def change
    rename_table :trades, :trade_details
  end
end
