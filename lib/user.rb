require 'data_mapper'
require_relative 'database_setup'

class User
  include DataMapper::Resource

  property :id, Serial
  property :firstname, String
  property :surname, String
  property :email, String
  property :password, String

end

DataMapper.auto_upgrade!
