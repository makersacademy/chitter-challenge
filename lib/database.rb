require 'dm-core'
require 'dm-migrations'
require 'dm-validations'
require 'dm-timestamps'

DataMapper.setup(:default, 'postgres://chitter:password@127.0.0.1/chitter')

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :user_id, Integer
  property :body, String
  property :created_at, DateTime

  belongs_to :user
end

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, :unique_index => true
  property :name, String
  property :email, String, :format => :email_address, :unique_index => true 
  property :password, String, :length => 6..255

  has n, :peeps
end

DataMapper.auto_upgrade!
