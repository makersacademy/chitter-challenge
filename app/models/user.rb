require_relative '../data_mapper_setup'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String, required: true, format: /\w+/
  property :email,    String, required: true, format: :email_address, unique: true
  property :username, String, required: true, unique: true, format: /\w+/
  property :password, BCryptHash, required: true

  has n, :peeps

  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password

  def self.authenticate(email, login_password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password) == login_password
      user
    else
      nil
    end
  end
end
