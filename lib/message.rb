class Message
  include DataMapper::Resource
  belongs_to :user
end
