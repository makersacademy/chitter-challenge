require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
# for new instances of User to join Chitter. Has 1-many relationship with peeps
class User
  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id, Serial
  property :username, String
  property :email, String

  validates_format :email, :email_address
end

DataMapper.finalize
DataMapper.auto_upgrade!
