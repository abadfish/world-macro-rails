class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string   :uploaded_file_file_name
      t.string   :uploaded_file_content_type
      t.integer  :uploaded_file_file_size
      t.datetime :uploaded_file_updated_at
      t.timestamps null: false
    end
  end
end
