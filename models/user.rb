require 'sinatra/activerecord'
require 'email_validator'
require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor :password_confirmation
  
  has_secure_password validations: false
  
  validates_presence_of :email, :username, :password_confirmation 
  validates_uniqueness_of :email, :username
  validates_length_of :password, minimum: 10, message: 'Try again! Your password must be at least 10 characters long'
  validates_confirmation_of :password, message: 'Try again@ Your passwords do not match'
  
  has_many :peeps
end 