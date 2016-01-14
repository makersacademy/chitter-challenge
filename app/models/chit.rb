class Chit
  include DataMapper::Resource

  property :id, Serial
  property :chit_text, Text
  # property :username, String

  belongs_to :user
end
