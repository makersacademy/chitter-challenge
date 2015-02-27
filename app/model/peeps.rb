class Peeps

  include DataMapper::Resource

    property :id, Serial
    property :peep, Text
    property :entry_time, Time

end