require 'data_mapper'
require 'dm-validations'

class Post
  include DataMapper::Resource

  property :id, Serial
  property :peep, Text
  property :creation_time, DateTime

  belongs_to :user

end

