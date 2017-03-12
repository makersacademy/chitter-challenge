require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,           Serial
  property :email,        String, :required => true, :format => :email_address, :unique => true,
  :messages => {
     :presence  => "We need your email address.",
     :is_unique => "We already have that email.",
     :format    => "Doesn't look like an email address to me ..."
   }

   property :password_salt, Text, :required => true
   property :name,          String
   property :username,      String, :required => true, :unique => true,:length => 5..10,
   :messages => {
      :presence  => "We need you to enter a username",
      :is_unique => "We already have that username."
    }

    has n, :peeps
    has n, :comments

    attr_accessor :password_confirmation
    attr_reader :password

    def password=(password)
      @password = password
      self.password_salt = BCrypt::Password.create(password)
    end

    validates_confirmation_of :password, :message => "Password and confirmation password do not match"
    validates_length_of :password, :min => 6, :message => "Password is too short"

    def self.authenticate(email, password)
      user = User.first(:email => email)

      user && BCrypt::Password.new(user.password_salt) == password ? user : nil
    end

end
