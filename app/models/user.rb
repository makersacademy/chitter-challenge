require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'
require_relative '../data_mapper_setup'


class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, :required => true, :format => :email_address, :unique => true
  property :username, String, :required => true, :unique => true
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password_method2=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
