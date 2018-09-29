require 'dm-core'
require 'dm-validations'
require 'dm-migrations'
require 'rubygems'


if ENV['ENVIRONMENT'] = 'test'
  DataMapper.setup(:default, 'postgres://aidanfaria:@localhost/chitter_test')
else
  DataMapper.setup(:default, 'postgres://aidanfaria:@localhost/chitter')
end

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep, Text
  property :created_at, DateTime
  belongs_to :user
end

class User
  include DataMapper::Resource

  property :id, Serial
  property :user, Text
  property :firstname, Text
  property :lastname, Text
  property :email, String
  property :password, Text
  has n, :peeps
end

DataMapper.auto_upgrade!
