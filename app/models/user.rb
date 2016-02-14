require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'
require_relative 'peep'


class User
  include DataMapper::Resource
  include BCrypt

  attr_accessor :password_confirmation
  attr_reader :password, :username

  has n, :peeps#, 'Peep',
    # parent_key: [:username],
    # child_key: [:body]

  property :id,   Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String,  :required => true, :unique => true
  property :password_digest, Text

  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, :as => :email_address
  validates_uniqueness_of :email


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
