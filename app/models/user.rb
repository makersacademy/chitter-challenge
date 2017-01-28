require 'bcrypt'

class User

  attr_reader 	:password
  attr_accessor	:password_confirmation

  include DataMapper::Resource

  property :id,					Serial
  property :name,				String
  property :email,				String, required: true, unique: true
  property :user_name,			String
  property :password_digest,	Text

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  def password=(password)
  	@password = password
  	self.password_digest = BCrypt::Password.create(password)
  end

  # def self.authenticate(email, password)
  # 	user = first(email: user_name)
  # 	p user
  # 	if user && BCrypt::Password.new(user.password_digest) == password
  # 	  user
  # 	else
  #     nil
  #   end
  # end

  def self.authenticate(user_name, password)
    user = first(user_name: user_name)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end