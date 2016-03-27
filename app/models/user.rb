require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id,         Serial
  property :name,       String,   :required => true
  property :email,      String,   :format => :email_address, :required => true,
                                  :unique => true,
                                  :messages => {
                                    :format => "That doesn't look like a valid email address.",
                                    :is_unique => "That email address already exists in Chitter.",
                                    :presence => "We need to your email address."
                                  }
  property :password_digest, Text
  property :username,   String,   :required => true, :unique => true,
                                  :messages => {
                                    :is_unique => "That username already exists in Chitter.",
                                    :presence => "You need a username to peep."
                                  }

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
