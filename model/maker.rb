require 'data_mapper'
require 'bcrypt'
require_relative 'peep'
require 'dm-validations'

class Maker
  include DataMapper::Resource

  attr_reader :password

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, Text, required: true

  validates_format_of :email, as: :email_address

  has n, :peeps

  # Here, we are over-riding what gets stored in our database when we create a new Maker in our
  # controller, i.e. we use Maker.create(password: params[:password]) (using the below password
  # method as our key, instead of Maker.create(password_digest: params[:password]). This results
  #in our password_digest property being saved as an encrypted hash+salt in our database.
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  # The Password.new method returns an object that has a different implementation of the equality
  #(==) method. Our initially instantiated password (i.e. the un-encrypted password) is being
  # compared to the password being passed in.
  def self.authenticate(username, password)
      maker = Maker.first(username: username)
      if maker && BCrypt::Password.new(maker.password_digest) == password
        maker
      else
        nil
      end
  end
end
