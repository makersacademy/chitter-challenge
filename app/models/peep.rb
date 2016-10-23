require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :message, String, :length => 150
  property :date_created, DateTime

end
