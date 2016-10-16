class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
  has_many :uploads
  has_many :comments
  has_many :users, through: :comments
  validates :content, presence: true

  def list_headlines
    n = News.new(news_source)
    @headlines = n.get_titles
  end

  def tag_name=(name)
    self.tag = Tag.find_or_create_by(name: name)
  end

  def tag_name
    self.tag.name if self.tag
  end

  def self.with_tag(tag_id)
    where(tag: tag_id)
  end
end
