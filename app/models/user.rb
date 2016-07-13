class User < ActiveRecord::Base
  has_many :posts
  has_many :trades
  accepts_nested_attributes_for :trades
  accepts_nested_attributes_for :posts
  validates :username, :email, :password, presence: true

  def trade_count
    self.trades.count
  end
end
