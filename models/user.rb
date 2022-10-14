require 'sinatra/activerecord'
require 'email_validator'
require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor :password_confirmation
  
  has_secure_password validations: false
  
  validates_presence_of :first_name, :last_name, :email, :username, :password_confirmation 
  validates_uniqueness_of :email, :username
  validates_length_of :password, minimum: 10
  validates_confirmation_of :password
  
  has_many :peeps
end 