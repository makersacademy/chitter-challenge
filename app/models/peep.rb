class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String, length: 2000
  property :name, String
  property :username, String
  belongs_to :user
end
