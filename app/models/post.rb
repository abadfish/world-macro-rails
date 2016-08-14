class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
  has_many :comments
  has_many :users, through: :comments
  validates :content, presence: true

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

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
end
