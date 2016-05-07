class Peep
  include DataMapper::Resource

  property :id, Serial
  property :maker, String
  property :user_handle, String
  property :body, Text,   :lazy => false  # Isn't lazy, will load by default

end
