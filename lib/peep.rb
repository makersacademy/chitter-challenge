class Peep
  include DataMapper::Resource

    property :id, Serial
    property :content, String
    property :time, String
    property :user, String
end