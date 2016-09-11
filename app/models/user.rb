require_relative '../data_mapper_setup'
require 'dm-validations'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,         Serial
  property :email,      String, required: true, unique: true, format: :email_address
  property :name,       String, required: true
  property :user_name,  String, required: true, unique: true
  property :password,   BCryptHash

  has n, :cheeps, through: Resource

  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address
  validates_uniqueness_of :email


  def self.authenticate (user_name, password)
    user = first(user_name: user_name)
    if user && BCrypt::Password.new(user.password) == password
      user
    else
      nil
    end
  end 


end
