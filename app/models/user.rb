require 'bcrypt'

module BookmarkManager
  module Models
    class User

      attr_reader :password
      attr_accessor :password_confirmation

      include DataMapper::Resource

      property :id, Serial
      property :email, String
      property :password_digest, Text
      property :name, String
      property :username, String

      def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
      end
    end
  end
end