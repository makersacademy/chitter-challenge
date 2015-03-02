class Cheet

  include DataMapper::Resource

  property :id, Serial
  property :text, String
  property :time, Date

end