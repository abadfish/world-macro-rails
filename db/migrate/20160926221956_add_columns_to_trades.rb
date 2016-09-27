class AddColumnsToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :product_type, :string
    add_column :trades, :target, :decimal
    add_column :trades, :stop, :decimal
    add_column :trades, :tick_value, :decimal
    add_column :trades, :risk, :decimal
    add_column :trades, :target_profit, :decimal
    add_column :trades, :realized, :decimal
    add_column :trades, :exit_date, :date
    add_column :trades, :exit_price, :decimal
    add_column :trades, :currency, :string
    add_column :trades, :rate_at_close, :decimal
    add_column :trades, :p_and_l_usd, :decimal
    add_column :trades, :category, :string
  end
end
