class Peep
  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id,      Serial
  property :content, Text, required: true
  property :time,    DateTime

  belongs_to :user
end
