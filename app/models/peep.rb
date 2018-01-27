class Peep
  # Give the class some database-interaction superpowers
  include DataMapper::Resource

  # Tell the class which columns exist in the student table
  property :id,     Serial
  property :body,   Text
  property :created_at, DateTime
end
