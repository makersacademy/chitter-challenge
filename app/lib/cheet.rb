class Cheet

  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :created_at, Date

  belongs_to :user

end
