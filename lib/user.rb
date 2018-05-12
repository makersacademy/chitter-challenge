require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'dm-core'
require 'dm-validations'
require 'dm-migrations'

class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :password, String

  if ENV['ENVIRONMENT'] == 'test'
    DataMapper.setup(:default, 'postgres://localhost/chitter_development')
    DataMapper.finalize
  else
    DataMapper.setup(:default, 'postgres://localhost/chitter')
    DataMapper.finalize
  end

end
