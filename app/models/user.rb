require 'bcrypt'

class User
include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirm

  # def self.authenticate(user_name, password)
  #   user = first(username: username)
  #   if user && BCrypt::Password.new(user.password_digest) == password
  #     user
  #   else
  #     nil
  #   end
  # end

  # validates_confirmation_of :password
  # validates_presence_of :email
  # validates_format_of :email, as: :email_address

    property :id, Serial
    property :name, String
    property :username, String
    property :email, String#, required: true, unique: true
    property :password_digest, Text

    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end

end
