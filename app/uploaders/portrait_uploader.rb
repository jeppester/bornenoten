class PortraitUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def cache_dir
    '../tmp/images'
  end

  def store_dir
    "uploads/#{model.class.to_s.dasherize.downcase}/#{model.id}/#{mounted_as}"
  end

  def default_url(*args)
    "/images/#{model.class.to_s.dasherize.downcase}/#{mounted_as}.png"
  end

  process resize_to_fill: [600, 600]

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    "#{Time.zone.now.to_i}.#{file.extension}" if original_filename
  end
end
