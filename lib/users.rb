require 'dm-core'
require 'dm-validations'

class Users
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :required => true, :unique => true, :format => :email_address,
  :messages => {
  :is_unique => 'Email already registered',
  :format => 'Valid email address required'
  }
  property :password, String, :length => 140
  property :name, Text
  property :username, String, :unique => true,
  :messages => {
    :is_unique => 'username in use, please pick another one'
  }

  # has n, :peeps
end
