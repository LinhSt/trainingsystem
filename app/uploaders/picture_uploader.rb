class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [200, 200]
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  #set default image

  def default_url(*args)
    ActionController::Base.helpers.asset_path("fallback/" + [version_name, "logo.png"].compact.join('_'))
  end
  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
