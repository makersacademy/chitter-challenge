class Peep

    include DataMapper::Resource

    belongs_to :user

    property :id,      Serial
    property :peep,    Text, length: 200
    property :time,    Time

end
