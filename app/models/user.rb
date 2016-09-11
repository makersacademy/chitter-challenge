require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
class User

  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String, unique: true, messages: { :is_unique => 'This username is already taken'}
  property :email, String, format: :email_address, required: true, unique: true,messages: {
      :presence  => "Please enter your email address",
      :is_unique => "This email address is already in use"}
  property :password_digest, Text

  validates_confirmation_of :password, :message => "Password and confirmation password do not match"


    attr_reader :password
    attr_accessor :password_confirmation


    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end

    def self.authenticate_user(email, login_password)
      raise "email or password incorrect" unless user = first(email: email)
      @db_password = BCrypt::Password.new(user.password_digest)
      if @db_password == login_password
      return user
      end
    end

    def self.authenticate_user(email, login_password)
        raise "email or password incorrect" unless user = first(email: email)
        @db_password = BCrypt::Password.new(user.password_digest)
        if @db_password == login_password
        return user
        end
      end

end
