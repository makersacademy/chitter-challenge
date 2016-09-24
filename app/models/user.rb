require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require_relative 'peep'

class User

  include DataMapper::Resource
  include BCrypt

  property :id , Serial
  property :name , String , required: true
  property :username , String , required: true , unique: true
  property :email , String , required: true, unique: true
  property :password_digest , Text

  has n, :peeps, through: Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
