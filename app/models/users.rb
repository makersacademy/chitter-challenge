require_relative '../data_mapper_setup'
require 'dm-validations'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,         Serial
  property :email,      String, required: true, unique: true
  property :name,       String, required: true
  property :user_name,  String, required: true, unique: true
  property :password,   BCryptHash

  attr_accessor :password_confirmation

  validates_confirmation_of :password

end
