class Chit
  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  # property :username, String

  belongs_to :user
end
