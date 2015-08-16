require 'bcrypt'

module Chitter
  module Models
    class User
      attr_reader :password
      attr_accessor :password_confirmation
      include DataMapper::Resource

      property :id, Serial
      property :email, String, required: true
      property :password_digest, Text
      property :name, String, required: true
      property :user_name, String, required: true
      has n, :peeps, through: Resource

      validates_uniqueness_of :email
      validates_uniqueness_of :user_name
      validates_confirmation_of :password

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
