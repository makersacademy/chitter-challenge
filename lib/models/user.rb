require 'data_mapper'
require 'dm-postgres-adapter'


class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, format: :email_address, required: true
  property :password, String
  property :name, String
  property :username, String


  def self.authenticate(username, password)
    first(username: username)
  end

end


DataMapper.setup(:default, "postgres://localhost/chitter_test")

DataMapper.finalize

DataMapper.auto_upgrade!