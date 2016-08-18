class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :posts, through: :comments
  has_many :insights
  accepts_nested_attributes_for :insights
  has_many :positions
  has_many :trades

  enum role: [:normal, :vip, :admin]
  # Include default devise modules. Others available are:
  #:lockable, :confirmable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.twitter_data"] && session["devise.twitter_data"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def insight_title=(title)
    self.insight = Insight.find_or_create_by(title: title)
  end

  def insight_title
    self.insight.title if self.insight
  end

  def insight_contents=(insights)
    insights.each do |insight|
      if !insight.empty?
        self.insights.build(insight: insight)
      end
    end
  end

  def insight_contents
    self.insights.collect { |insight| insight.content }
  end
end
