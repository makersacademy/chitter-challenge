class Peep
  include DataMapper::Resource
  property :id, Serial
  property :peep, String, length: 140
  property :username, String
  # belongs_to :user
end
