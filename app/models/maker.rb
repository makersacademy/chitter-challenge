require 'bcrypt'

class Maker

  include DataMapper::Resource
  include BCrypt

  has n, :peeps, through: Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :username, String
  property :password, BCryptHash

  validates_confirmation_of :password
  validates_presence_of :name, :email, :username, :password
  validates_uniqueness_of :email, :username
  validates_format_of :email, as: :email_address

  def self.authenticate(username, password)
    maker = first(username: username)
    if maker && BCrypt::Password.create(maker.password) == password
      maker
    else
      return nil
    end
  end

  attr_accessor :password_confirmation

end
