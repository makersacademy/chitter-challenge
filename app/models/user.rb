require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  # propety :password, Password

end

DataMapper.setup(:default, 'postgres://localhost/chitter')
DataMapper.finalize
DataMapper.auto_upgrade!



