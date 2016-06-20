# understands user status
require 'bcrypt'

class User 

	include DataMapper::Resource

	has n, :peeps

	property :id, Serial
	property :name, String
	property :email, String, format: :email_address, :unique => true 
	property :username, String, :unique => true 

	attr_reader :password
  attr_accessor :password_confirmation
	
	property :password_digest, String, length: 60

	validates_confirmation_of :password
  validates_presence_of :password
  validates_presence_of :email
  validates_presence_of :username
  validates_presence_of :name

  def password=(password)
  	@password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)

      if user && BCrypt::Password.new(user.password_digest) == password
        user
      else
        nil
      end
  end



end