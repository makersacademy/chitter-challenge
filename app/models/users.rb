require_relative '../data_mapper_setup'
require 'bcrypt'
require 'dm-validations'

class Users
  include DataMapper::Resource

  property :id,       Serial
  property :username, String,     :required => true, :unique => true
  property :email,    String,     :required => true, :unique => true
  property :password, BCryptHash, :required => true

  attr_reader   :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_uniqueness_of :username, :email
  validates_format_of :email, :as => :email_address



end
