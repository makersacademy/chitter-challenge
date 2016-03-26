class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, length: 140, required: true

  belongs_to :user
end
