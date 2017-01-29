require './app/data_mapper_setup'

class User

  include DataMapper::Resource

  property :id,             Serial
  property :name,           String, required: true
  property :email,          String, required: true, unique: true, format: :email_address
  property :password,       BCryptHash, required: true
  attr_accessor :password_confirmation

  validates_confirmation_of :password, confirm: :password_confirmation

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password) == password
      user
    else
      nil
    end
  end

end
