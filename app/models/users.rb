require_relative '../data_mapper_setup'
require 'bcrypt'
require 'dm-validations'

class Users
  include DataMapper::Resource

  property :id,       Serial
  property :username, String,     :required => true, :unique => true
  property :name,     String,     :required => true
  property :email,    String,     :required => true, :unique => true
  property :password, BCryptHash, :required => true

  has n, :peepss

  attr_reader   :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_uniqueness_of :username, :email
  validates_format_of :email, :as => :email_address

  def self.signin(username,password)
    user = first(:username => username)
    if user && user.password == password
      user
    else
      nil
    end
  end

  # def self.authenticate(password)
  #   :password == password
  # end

end
