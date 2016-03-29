require 'pry'
require 'bcrypt'

class User 
  include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :username, String
    property :email, String, format: :email_address, required: true
    property :password_hash, Text

    has n, :feed

    attr_reader :password
    attr_accessor :password_confirmation


    validates_confirmation_of :password
    validates_uniqueness_of :email
    validates_uniqueness_of :username


    def password=(password)
      @password = password
      self.password_hash=BCrypt::Password.create(password)
    end

    def self.authenticate(email, password)
      user = first(:email)
      if user && BCrypt::Password.new(user.password_hash) == password
        user
      else
        nil
      end
    end

end