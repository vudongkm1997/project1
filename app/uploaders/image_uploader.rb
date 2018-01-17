class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [400, 400]

  storage :file

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
