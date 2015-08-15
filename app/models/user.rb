require 'bcrypt'
module ChitterModule
  module Models
    class User

      attr_reader :password
      attr_accessor :password_confirmation

      include DataMapper::Resource

      property :id, Serial
      property :email, String
      property :password_digest, Text
      property :name, String
      property :user_name, String

      validates_confirmation_of :password
      validates_uniqueness_of :user_name
      validates_uniqueness_of :email

      def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
      end

      def self.authenticate(email, password)
        user = self.first(email: email)
        if user && BCrypt::Password.new(user.password_digest) == password
          user
        end
      end

    end
  end
end

