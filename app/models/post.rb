require 'data_mapper'
require 'dm-validations'

class Post
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :name, String
  property :peep, Text

  belongs_to :user

end

