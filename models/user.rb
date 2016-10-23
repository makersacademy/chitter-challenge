require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :username_db, String
  property :email_db, String
  property :password_db, Text

end
