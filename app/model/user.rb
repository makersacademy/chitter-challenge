require 'bcrypt'

class User
  include DataMapper::Resource

    property :id, Serial
    property :email,  String, :unique => true, :message => "This email is already taken"
    property :name, String
    property :user_name, String, :unique => true, :message => "This user is already taken"
    property :password_digest, Text

    has n, :peeps

    attr_reader :password
    attr_accessor :password_confirmation

    validates_confirmation_of :password

    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end

    def self.authenticate(user_name, password)
      user = first(:user_name => user_name)

      if user && BCrypt::Password.new(user.password_digest) == password
        user
      else
        nil
      end
    end

end

