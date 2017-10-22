require 'bcrypt'

class Maker

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text

    validates_confirmation_of :password

    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end

    def self.authenticate(email, password)
    first(email: email)
    end

end
