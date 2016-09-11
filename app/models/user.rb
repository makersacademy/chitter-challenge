require './data_mapper_setup.rb'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  property :id, Serial
  property :email, String, required: true, format: :email_address
  property :password, BCryptHash
  property :name, String
  property :nickname, String
end
