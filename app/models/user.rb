require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'
require_relative './data_mapper_setup.rb'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :user_name, String, required: true
  property :email, String, required: true, unique: true
  property :password_digest, Text, required: true

  attr_reader :password
  attr_accessor :confirm_password

  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end

setup
