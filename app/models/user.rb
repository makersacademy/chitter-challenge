require './app/data_mapper_setup.rb'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String, required: true, unique: true
  property :username, String, required: true, unique: true
  property :name, String, required: true
  property :password_digest, Text

  has n, :messages, through: Resource

  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password
  validates_format_of :email, :as => :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
