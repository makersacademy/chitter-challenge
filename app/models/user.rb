require 'bcrypt'

module ChitterModule

  module Models

    class User

      attr_reader :password
      attr_accessor :password_confirmation

      include DataMapper::Resource

      property :id, Serial
      property :email, String, required: true
      property :password_digest, Text
      property :name, String
      property :user_name, String, required: true

      has n, :peeps

      validates_confirmation_of :password
      validates_uniqueness_of :user_name
      validates_uniqueness_of :email

      def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
      end

      def self.authenticate(user_name, password)
        user = self.first(user_name: user_name)
        if user && BCrypt::Password.new(user.password_digest) == password
          user
        end
      end
    end

  end

end

