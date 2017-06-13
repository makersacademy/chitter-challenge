require_relative './image_uploader'
require 'carrierwave/datamapper'

class Image
  include DataMapper::Resource

  property :id, Serial

  mount_uploader :file, ImageUploader
end