require 'data_mapper'

class User

  include DataMapper::Resource

  property :user_id, Serial
  property :username, String
  property :real_name, String
  property :email, String

end
