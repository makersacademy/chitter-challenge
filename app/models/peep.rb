require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :created_at, DateTime

  belongs_to :user

end
