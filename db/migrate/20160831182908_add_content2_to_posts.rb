class AddContent2ToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :content_2, :text
  end
end
