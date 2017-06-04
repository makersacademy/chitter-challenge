require 'carrierwave/datamapper'

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
end

class Image
  include DataMapper::Resource

  property :id, Serial

  mount_uploader :source, ImageUploader
end