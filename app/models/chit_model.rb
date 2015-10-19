class Chit

  include DataMapper::Resource

    property :id,     Serial
    property :time,   Text
    property :text,   Text

    belongs_to :user

end
