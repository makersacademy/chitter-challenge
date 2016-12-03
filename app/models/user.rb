require 'bcrypt'
require 'dm-validations'

class User

  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :email, Text
  property :password_hash, Text
  attr_reader :password
  attr_accessor :password_confirm

  validates_confirmation_of :password, confirm: :password_confirm

  @@count = 0

  def initialize
  end

end
