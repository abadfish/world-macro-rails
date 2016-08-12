class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :posts, through: :comments

  has_many :positions
  has_many :trades

  enum role: [:normal, :vip, :admin]
  # Include default devise modules. Others available are:
  #:lockable, :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
