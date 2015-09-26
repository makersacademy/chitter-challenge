require 'bcrypt'

module ChitterApp
  module Models
    class User
      include DataMapper::Resource
      property :id, Serial
      property :username, String, required: true, unique: true
      property :email, String, required: true, unique: true
      property :password_digest, Text
      property :password_token, Text
      attr_reader :password, :email, :username
      attr_accessor :password_confirmation
      validates_confirmation_of :password
      def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
      end
      def self.authenticate(username, password)
        user = User.first(username: username)
        if user && BCrypt::Password.new(user.password_digest) == password
          user
        else
          nil
        end
      end
    end
  end
end
