class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep_content, Text
  property :created_at, DateTime
  property :created_on, Date

  belongs_to :user

end
