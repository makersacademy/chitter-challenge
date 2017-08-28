require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

   property  :id,   Serial
   property  :username,  String
   property  :password,  String

end
