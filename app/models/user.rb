require 'bcrypt'

module Chitter
  module Models
    class User
      attr_reader :password
      attr_accessor :password_confirmation
      include DataMapper::Resource

      property :id, Serial
      property :email, String
      property :password_digest, Text
      property :name, Text
      property :user_name, Text

      def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
      end

      def self.authenticate(email, password)
        user = first(email: email)
        user && BCrypt::Password.new(user.password_digest) == password ? user : nil
      end
    end
  end
end
