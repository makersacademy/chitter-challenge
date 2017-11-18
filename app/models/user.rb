require_relative '../data_mapper_config'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email, String, :format => :email_address
  property :name, String
  property :password_digest, Text

  has n, :peeps

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  validates_presence_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
