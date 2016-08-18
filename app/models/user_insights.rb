class UserInsights < ActiveRecord::Base
  belongs_to :user
  belongs_to :insight
end
