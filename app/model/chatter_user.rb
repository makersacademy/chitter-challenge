require 'bcrypt'

class ChatterUser

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password


  property :id, Serial
  property :name, String
  property :email, String, format: :email_address, required: true, unique: true
  property :creation_date, DateTime
  property :password_hash, Text
  has n, :peeps


  def password=(input)
    @password = input
    self.password_hash = BCrypt::Password.create(input)
  end






end
