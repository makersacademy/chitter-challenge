require 'bcrypt'

module Chitter
  module Models
    class User

      attr_reader :password
      attr_accessor :password_confirmation

      include DataMapper::Resource

      validates_confirmation_of :password
      validates_uniqueness_of :email

      property :id, Serial
      property :email, String, required: true
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