require 'bcrypt'
require "dm-validations"

class User
  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id,          Serial
  property :username,    String, required: true, unique: true
  property :email,       String, required: true, unique: true, format: :email_address
  property :name,        String, required: true
  property :password_digest,    Text, required: true





    validates_presence_of :email
    validates_presence_of :username

    def self.authenticate(username, password)
      user = first(username: username)
      if user && BCrypt::Password.new(user.password_digest) == password
        user
      else
        nil
      end
    end


    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end
end
