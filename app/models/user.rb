# new signed up peeps
require 'bcrypt'

class User

  include DataMapper::Resource

    property :id, Serial
    property :email, String, required: true, format: :email_address, unique: true
    property :name, String
    property :user_name, String

    property :password_digest, Text

    attr_accessor :password_confirmation
    attr_reader :password

    validates_confirmation_of :password

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
