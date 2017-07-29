require './app/data_mapper_setup'

class User
  include DataMapper::Resource

  has n, :peeps

  property :id,       Serial
  property :name,     String
  property :nickname, String
  # property :email,    String
  # property :password, String

end
