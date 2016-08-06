class Post < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :user

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  def list_headlines
    n = News.new
    @headlines = n.get_titles
  end

end
