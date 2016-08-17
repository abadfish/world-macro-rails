class ContributorInsights < ActiveRecord::Base
  belongs_to :contributor
  belongs_to :insight
end
