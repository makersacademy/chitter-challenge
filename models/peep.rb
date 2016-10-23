require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  has 1, :user, through: Resource
  property :id,               Serial
  property :text,             Text
  property :created_at,       Time


end
