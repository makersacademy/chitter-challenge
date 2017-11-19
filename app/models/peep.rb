require 'data_mapper'
require 'dm-postgres-adapter'
require 'time'

class Peep
  include DataMapper::Resource

  property :id,     Serial
  property :message,  String
  property :datetime,    Time
  # property :name,    String
  # property :user_name,    String

end
