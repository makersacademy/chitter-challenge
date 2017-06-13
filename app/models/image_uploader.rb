require 'carrierwave'
require 'carrierwave/datamapper'
require 'mime-types'

CarrierWave.configure do |config|
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'eu-west-2'
  }
  config.fog_directory = 'tinyblogger'
end

class ImageUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
    'uploads/user_pics'
  end

  def cache_dir
    'uploads/tmp'
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
