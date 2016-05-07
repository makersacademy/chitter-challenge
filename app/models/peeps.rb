require 'data_mapper'
require 'dm-postgres-adapter'



class Peep

  include DataMapper::Resource

  property :id, Serial
  property :title, Text
  property :text, String
  property :context, String

  belongs_to :user
end
