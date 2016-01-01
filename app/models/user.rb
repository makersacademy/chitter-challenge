require 'data_mapper'
require 'dm-postgres-adapter'

# This class corresponds to a table in the database
# We can use it to manipulate the data
class User

  # adds datamapper functionality to this class
  include DataMapper::Resource

  # these property declarations set the column headers in the Link table
  property :id, Serial
  property :email, String
  property :password, Text
  property :name, Text
  property :username, Text

end

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
