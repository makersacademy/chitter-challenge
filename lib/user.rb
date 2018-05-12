require 'data_mapper'

if ENV['RACK_ENV'] == 'test'
  DataMapper.setup(:default, 'postgres://localhost/chitter_test')
else
  DataMapper.setup(:default, 'postgres://localhost/chitter')
end

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :required => true
end

DataMapper.finalize
User.auto_upgrade!
