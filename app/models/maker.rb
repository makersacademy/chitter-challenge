require 'bcrypt'

class Maker

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :email, String
  property :username, String
  property :password, BCryptHash

  validates_confirmation_of :password
  validates_presence_of :name, :email, :username, :password_confirmation
  validates_uniqueness_of :email, :username
  validates_format_of :email, as: :email_address

  def self.authenticate(username, password)
    maker = first(username: username)
    if maker && Password.new(maker.password) == password
      maker
    else
      return nil
    end
  end

  has n, :peeps

  attr_accessor :password_confirmation

end
