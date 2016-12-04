require'./app/data_mapper_setup'
require 'dm-validations'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :user_name, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, Text, required: true

  attr_reader :password
  attr_accessor :confirm_password

  # validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(user_name, password)
    user = first(user_name: user_name)

    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end

setup
