

class Peep

    include DataMapper::Resource

    property :id, Serial
    property :message, Text
    property :time_posted, DateTime

end
