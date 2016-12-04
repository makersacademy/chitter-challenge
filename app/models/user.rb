require 'bcrypt'
require 'dm-validations'
require './app/data_mapper_setup'

class User

  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :email, Text
  property :name, String
  property :handle, String
  property :password_hash, Text
  attr_reader :password
  attr_accessor :password_confirm

  validates_confirmation_of :password, confirm: :password_confirm

  @@count = 0

  def initialize(params)
    self.email = params[:email]
    self.password = params[:password]
    self.password_confirm = params[:password_confirm]
    self.name = params[:name]
    self.handle = params[:handle]
    self.save
    @@count += 1
  end

  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
  end

  def count
    @@count
  end

end
