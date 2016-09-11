require_relative '../data_mapper_setup'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String, required: true
  property :username, String, required: true, unique: true
  property :email,    String, required: true, format: :email_address, unique: true
  property :password, BCryptHash, required: true

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
end
