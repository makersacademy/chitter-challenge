require 'bcrypt'
require 'dm-validations'
require './app/data_mapper_setup'

class User

  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :name, String
  property :handle, String
  property :password_hash, Text

  attr_reader :password
  attr_accessor :password_confirm

  has n, :peeps

  validates_confirmation_of :password, confirm: :password_confirm
  validates_format_of :email, as: :email_address
  validates_presence_of :password

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_hash) == password
      user
    else
      nil
    end
  end
end
