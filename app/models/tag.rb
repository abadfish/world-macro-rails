class Tag < ActiveRecord::Base
  has_many :posts
  validates_uniqueness_of :name

  def post_ids=(ids)
       ids.each do |id|
         post = Post.find(id)
         self.posts << post
       end
     end
end
