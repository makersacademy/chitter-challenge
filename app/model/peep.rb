require_relative 'user'
class Peep
  include DataMapper::Resource

  has 1, :user, :through => Resource

  property :id,     Serial
  property :content,  String
  property :time, DateTime
end
