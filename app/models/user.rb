require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :username, String, :required => true, :unique => true, :messages => {
    :presence => 'A Username is required',
    :is_unique => 'We already have that username.'
  }
  property :email, String, :required => true, :unique => true, :format => :email_address,
  :messages => {
    :presence => 'A valid email address is required',
    :is_unique => 'We already have that email.',
    :format => "That doesn't look like an email address to me.."
  }
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
