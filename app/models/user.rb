require_relative '../data_mapper_setup'
# require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :username, String
  property :email, String
  property :password, Text
end
