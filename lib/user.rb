require 'data_mapper'

DataMapper.setup(:default, 'postgres://localhost/chitter_test')

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :required => true
end

DataMapper.finalize
User.auto_upgrade!
