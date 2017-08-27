require 'data_mapper'
require 'dm-migrations'
require 'dm-timestamps'


class User
  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id,    Serial
  property :user, String
  property :name, String
end
