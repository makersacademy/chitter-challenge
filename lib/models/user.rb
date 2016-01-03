require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require_relative 'peep'


class User
  attr_reader :password
  attr_accessor :password_confirmation
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :name, String
  property :email, String
  property :password_digest, Text

  has n, :peep


  validates_confirmation_of :password
  validates_presence_of :email, :name, :username
  validates_length_of :username, :within => 5..15
  VALID_EMAIL_REGEX = /\A[\w+.\-]+@[a-z\-+.]+\.[a-z]+\z/i
  validates_format_of :email, with: VALID_EMAIL_REGEX

  property :email, String, required: true, unique: true
  property :name, String, required: true
  property :username, String, required: true, unique: true


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

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
