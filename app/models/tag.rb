class Tag < ActiveRecord::Base
  has_many :posts

  def post_ids=(ids)
       ids.each do |id|
         post = Post.find(id)
         self.posts << post
       end
     end
end
