require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  attr_accessor :password_confirmation

  property :id, Serial
  property :user_name, String, :unique => true
  property :email, String, :unique => true, :format => :email_address, required: true
  property :password, BCryptHash

  validates_confirmation_of :password

end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
