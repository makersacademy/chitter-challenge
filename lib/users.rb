require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-migrations'

if ENV['ENVIRONMENT'] == 'test'
  DataMapper.setup(:default, 'postgres://localhost/chitter_test')
else
  DataMapper.setup(:default, 'postgres://localhost/chitter')
end

class Users
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :required => true, :unique => true, :format => :email_address
  property :password, String, :length => 140
  property :name, Text
  property :username, String, :unique => true

end

DataMapper.finalize
DataMapper.auto_upgrade!
