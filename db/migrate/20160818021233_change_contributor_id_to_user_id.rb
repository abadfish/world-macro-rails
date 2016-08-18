class ChangeContributorIdToUserId < ActiveRecord::Migration
  def change
    remove_column :insights, :contributor_id, :integer
    add_column :insights, :user_id, :integer
  end
end
