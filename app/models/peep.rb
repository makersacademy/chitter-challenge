class Peep
  include DataMapper::Resource

    property :id, Serial
    property :date, DateTime
    property :content, String, :length => 200

    belongs_to :user

end
