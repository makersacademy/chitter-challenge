require 'data_mapper'

class Peep

  include DataMapper::Resource

  property :id,        Serial
  property :message,   Text
  property :username,  String
  property :name,      String
  property :time_date, DateTime, :default => lambda { |p,s| DateTime.now }

end
