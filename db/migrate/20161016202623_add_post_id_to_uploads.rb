class AddPostIdToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :post_id, :integer
  end
end
