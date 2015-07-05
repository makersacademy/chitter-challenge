class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :name, String
  property :username, String

  belongs_to :user

end