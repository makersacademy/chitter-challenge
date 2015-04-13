class Peep

  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :content, String, message: 'The peep is too long, 50 characters max'
  property :created_at, DateTime

end