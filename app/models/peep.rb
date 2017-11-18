require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id,     Serial
  property :message,  String
  #property :time,    String
  #property :date,    String
  # property :name,    String
  # property :user_name,    String

end
