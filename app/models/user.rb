require 'bcrypt'

module ChitterApp
  module Models

    class User

      include DataMapper::Resource

      attr_reader :password
      attr_accessor :password_confirmation

      validates_confirmation_of :password
      validates_uniqueness_of :email
      validates_uniqueness_of :handle


      property :id,              Serial
      property :email,           String, required: true
      property :handle,          String, required: true
      property :password_digest, Text

       has n, :peeps, through: Resource

      def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
      end

      def self.authenticate(handle, password)

      user = first(handle: handle)
        if user && BCrypt::Password.new(user.password_digest) == password
          user
        end
      end

    end
  end
end
