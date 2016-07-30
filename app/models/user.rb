require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id,        Serial
  property :email,     String
  property :password,  String
  property :name,      String
  property :username,  String
end

#Connects to the database
DataMapper.setup(:default, "postgres://localhost/chitter_test")
# Let's check that everything we wrote in our models was OK
DataMapper.finalize
# And let's build any new columns or tables we added
DataMapper.auto_upgrade!
