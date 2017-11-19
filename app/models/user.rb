require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

include DataMapper::Resource

  property :id, Serial
  property :email, String#, :required => true, :format => :email_address, :unique => true
  property :name, String#, :required => true
  property :username, Text#, :required => true, :unique => true
  property :password_digest, Text

  attr_accessor :password_confirmation
  attr_reader :password

  has n, :tweets, :through => Resource

  validates_confirmation_of :password
  # validates_confirmation_of :email #, :confirm => :email_repeated

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
