require_relative '../data_mapper_setup'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :unique => true, :format => :email_address 
  property :password, BCryptHash

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

end
