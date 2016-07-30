require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :second_name, String
  property :username, String, length: 20, required: true, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password, String, length: 60
  property :password_confirmation, String, length: 60


  attr_accessor :password_confirmation
  attr_reader :password
  validates_confirmation_of :password
  # validates_format_of :email, as: :email_address

  def password=(new_password)
      @password = new_password
      self.password_confirmation = BCrypt::Password.create(new_password)
  end

  def self.authenticate(email, password)
    user = first(email: email)

    if user && BCrypt::Password.new(user.password_confirmation)== password
      user
    else
      nil
    end
  end

end
