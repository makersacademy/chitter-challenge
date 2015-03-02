class Cheet

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :text, String
  property :time, Date

end