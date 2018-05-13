require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'dm-core'
require 'dm-validations'
require 'dm-migrations'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String, :required => true, :unique => true,
  :messages => {
      :presence  => "Please enter a username.",
      :is_unique => "Sorry, username is already taken"
    }
  property :password, String, :required => true,
  :messages => {
      :presence  => "Please enter a password."
    }

  if ENV['ENVIRONMENT'] == 'test'
    DataMapper.setup(:default, 'postgres://localhost/chitter_development')
    DataMapper.finalize
  else
    DataMapper.setup(:default, 'postgres://localhost/chitter')
    DataMapper.finalize
  end

  # has n, :peeps

end
