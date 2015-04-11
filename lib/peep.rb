class Peep
  include DataMapper::Resource
    has n, :replys, :through=>DataMapper::Resource

    property :id, Serial
    property :content, String
    property :time, String
    property :user, String
end