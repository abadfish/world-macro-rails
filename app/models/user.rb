class User < ActiveRecord::Base
  has_many :posts
  has_many :positions
  has_many :trades, through: :positions

  enum role: [:normal, :vip, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
