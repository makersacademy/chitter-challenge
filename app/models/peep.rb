class Peep
  include DataMapper::Resource
    property :id, Serial
    property :text, String
    property :time, Time
end