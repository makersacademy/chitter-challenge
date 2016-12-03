require 'dm-core'
require 'dm-validations'

class User

  include DataMapper::Resource

  has n, :peeps, :through => Resource

  property :id, Serial
  property :email, String
  property :name, String
  property :username, String, :unique => true

end
