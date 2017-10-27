require 'bcrypt'

class User

    include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :user_name, String
    property :password_digest, Text

    def password=(password)
      self.password_digest = BCrypt::Password.create(password)
    end

    def self.authenticate(user_name, password)
      user = first(user_name: user_name)
      if user && BCrypt::Password.new(user.password_digest) == password
        user # user gets authenticated
      else
        nil
      end
    end

end
