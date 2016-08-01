require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  belongs_to :user

  property  :id,         Serial
  property  :text,       Text
  property  :name,       Text
  property  :username,   Text
  property  :created_at, DateTime

end
