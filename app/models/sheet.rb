class Sheet

  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  property :created_at, DateTime

  belongs_to :user, :required => false

end