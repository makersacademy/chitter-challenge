require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

#has 1, :user, through: Resource
  belongs_to :user

  property :id, Serial
  property :body, Text
  property :created_at, DateTime
  property :peep_author_name,  String
  property :peep_author_username, String
end
