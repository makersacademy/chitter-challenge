require "data_mapper"
require "dm-postgres-adapter"
require 'bcrypt'

class User

  include DataMapper::Resource
  has n, :peeps
  has n, :comments

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, :as => :email_address

  property :id, Serial
  property :name, String, required: true
  property :user_name, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def authenticated?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

end
