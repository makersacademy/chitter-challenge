require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  # has n, :tags, through: Resource

  property :id, Serial, required: true
  property :name, String, required: true
  property :email, String, required: true
  property :handle, String, required: true
  property :password_digest, Text, required: true

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
