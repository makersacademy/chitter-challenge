require 'data_mapper'
require 'dm-core'
require 'dm-timestamps'

 class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  belongs_to :user
end
