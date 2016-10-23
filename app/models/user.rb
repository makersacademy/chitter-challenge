require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  property :id, Serial
  property :email, String, :required => true, :unique => true, :format => :email_address,
           :messages => {
             :presence => "Please fill in your email address",
             :is_unique => "This email address has already been registered, please use a different one",
             :format => "Please fill in a valid email address"
           }
  property :password_digest, Text, :required => true
  property :name, String, :required => true,
           :messages => {
             :presence => "Plesae fill in your name"
           }
  property :username, String, :required => true, :unique => true,
           :messages => {
             :presence => "Please fill in a username",
             :is_unique => "This username has already been taken. Please choose a different one"
           }
  # has n, :tags, :through => Resource

  def password=(password)
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
