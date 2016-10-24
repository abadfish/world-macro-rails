module ApplicationHelper

  def s3_image_path(filename)
  "http://s3.amazonaws.com/world-macro-charts/#{filename}"
  end

  def s3_image_tag(filename, options={})
    image_tag(s3_image_path(filename), options)
  end

end
