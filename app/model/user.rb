require 'bcrypt'

  class User
    include DataMapper::Resource

    property :id, Serial
    property :email,  String, :unique => true, :message => "Email account is already taken"
    property :password_digest, Text

    attr_reader :password
    attr_accessor :password_digest

    validates_confirmation_of :password, :message => "Sorry, your password doesn't match"
    validates_uniqueness_of :email

    def password=(password)
      @password = password
      puts "hello"
      self.password_digest = BCrypt::Password.create(password)
    end

    def self.authenticate(email, password)
      user = User.first(:email => email)
      if user && BCrypt::Password.new(user.password_digest) == password
        user
      else
        nil
      end
    end

end