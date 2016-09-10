require './data_mapper_setup.rb'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, format: :email_address
  property :password, BCryptHash
  property :name, String
  property :nickname, String
end
