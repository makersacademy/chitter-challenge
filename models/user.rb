require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password, :count
  attr_accessor :password_confirmation

  property :id, Serial
  property :user_name, String
  property :name, String
  property :email, String, required: true, unique: true
  property :password_digest, Text
  validates_confirmation_of :password


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  @count = 0

  def self.count
    @count += 1
  end

  # has n, :peeps, through: Resource

end
