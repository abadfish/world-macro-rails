class Upload < ActiveRecord::Base
  belongs_to :post

  has_attached_file :uploaded_file, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates_attachment_content_type :uploaded_file, content_type: /\Aimage\/.*\Z/
end
