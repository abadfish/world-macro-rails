class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  storage :file

  process :convert => 'png'
  process :tags => ['post_image']

  version :standard do
    process :eager => true
    process :resize_to_fill => [100, 150, :north]
  end

  version :thumbnail do
    resize_to_fit(50, 50)
  end

  def public_id
    return model.short_name
  end

end
