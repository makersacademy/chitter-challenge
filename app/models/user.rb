require 'bcrypt'
require 'data_mapper'

class User
  include DataMapper::Resource
  property :id,         Serial
  property :name,       String
  property :username,   String,
    :required => true,
    :unique => true,
    :messages => {
      :presence  => "We need your username.",
      :is_unique => "We already have that username."
    }
  property :email, String,
    :required => true,
    :unique => true,
    :format   => :email_address,
    :messages => {
      :presence  => "We need your email address.",
      :is_unique => "We already have that email address.",
      :format    => "Doesn't look like an email address to me ..."
    }
  property :password_digest,   Text

  # attr_reader :password

  # has n, :links

  def password=(password)
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
