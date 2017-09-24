require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id,         Serial
  property :email,      String, required: true,
                                format: :email_address,
                                unique: true
  property :name,       String, required: true,
                                messages: {
                                  presence: "Name must not be blank"
                                }
  property :user_name,  String, required: true,
                                unique: true,
                                messages: {
                                  presence: "User Name must not be blank",
                                  is_unique: "User Name is already taken"
                                }
  property :password_digest, Text

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(user_name, password)
    user = first(user_name: user_name)

    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
