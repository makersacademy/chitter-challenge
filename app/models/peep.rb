class Peep

  include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :time, DateTime

end
