require 'data_mapper'
require 'dm-validations'

class Post
  include DataMapper::Resource

  property :id, Serial
  property :peep, Text

  belongs_to :user

end

