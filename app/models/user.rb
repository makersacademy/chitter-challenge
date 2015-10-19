require 'data_mapper'
require './app/data_mapper_setup'
require 'bcrypt'

class User
  include DataMapper::Resource


    attr_reader :password
    attr_accessor :password_confirmation

    property :id, Serial
    property :username, String
    property :email, String, required: true, unique: true
    property :password_digest, Text

    has n, :peep, through: Resource

    validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
