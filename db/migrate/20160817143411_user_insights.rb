class UserInsights < ActiveRecord::Migration
  def change
    create_table :user_insights do |t|
      t.integer :user_id
      t.integer :insight_id

      t.timestamps null: false
    end
  end
end
