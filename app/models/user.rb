require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true, format: :email_address
  property :password, BCryptHash
  has n, :peeps
  attr_accessor :password_conf

  validates_confirmation_of :password, confirm: :password_conf
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :name
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password) == password
      user
    else
      nil
    end
  end
end
