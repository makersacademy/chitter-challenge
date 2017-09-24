# For new instances of Peeps on user's Chitter account
class Peep
  include DataMapper::Resource
  property :id, Serial
  property :peep, String
  property :timestamp, Time
end
