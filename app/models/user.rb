require 'bcrypt'
require 'dm-validations'



class User
  include DataMapper::Resource
  # include BCrypt

  property :id, Serial
  property :email, String, required: true
  property :password_hash, Text, required: true

  has n, :peeps, through: Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :email

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def self.authenticate(params)
    email = params[:email]
    password = params[:password]
    user = first(email: email)

    if user && BCrypt::Password.new(user.password_hash) == password
      user
    else
      nil
    end
  end
end
