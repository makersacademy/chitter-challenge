require 'pry'
require 'bcrypt'

class User 
  include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :email, String, format: :email_address, required: true
    property :password_hash, Text

    attr_reader :password
    attr_accessor :password_confirmation


    validates_confirmation_of :password
    validates_uniqueness_of :email


    def password=(password)
      @password = password
      self.password_hash=BCrypt::Password.create(password)
    end

end