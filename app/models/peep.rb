class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :user_name, String
  property :user_handle, String

end
