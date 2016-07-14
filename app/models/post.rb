class Post < ActiveRecord::Base
  belongs_to :user

  mount_uploader :picture, PictureUploader


  def list_headlines
    n = News.new
    @headlines = n.get_titles
  end

end
