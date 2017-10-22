require 'bcrypt'

class Maker

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true
  property :email, String, required: true
  property :password_digest, Text

  def password=(password)
      self.password_digest = BCrypt::Password.create(password)
    end

    validates_confirmation_of :password

    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end
end
