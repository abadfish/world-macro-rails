class CreateInsights < ActiveRecord::Migration
  def change
    create_table :insights do |t|
      t.string :title
      t.text :content
      t.integer :contributor_id
      t.timestamps null: false
    end
  end
end
