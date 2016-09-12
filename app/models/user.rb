require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'bcrypt'
require_relative 'peep'

class User

  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email, String, required: true, unique: true
  property :password, BCryptHash

  has n, :peeps, through: Resource

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  attr_accessor :password_confirmation
  attr_reader :password

  def self.authenticate(email, password)
    user = first(:email => email)
    if user && BCrypt::Password.new(user.password) == password
      user
    else
      nil
    end
  end

end
