require 'bcrypt'
require 'dm-migrations'


class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource


  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text
  property :name, String
  property :username, String, required: true

  has n, :peeps


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


  validates_confirmation_of :password
  validates_format_of :email, :as => :email_address
  validates_uniqueness_of :username
end
