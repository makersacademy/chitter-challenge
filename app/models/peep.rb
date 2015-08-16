class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, length: 130

  belongs_to :user

end