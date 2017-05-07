class User
  include DataMapper::Resource
  include BCrypt
  property :id, Serial
  property :name, String, required: true
  property :user_name, String, required: true
  property :email, String, required: true, unique: true,
  format: :email_address,
  messages: {
    :presence => "You must provide an email address",
    :is_unique => "This email is already registered",
    :format => "Email must have correct format"
  }
  property :password_digest, Text, required: true
  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  has n, :peeps, through: Resource

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def self.authenticate(username, password)
    user = User.first(:user_name => username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
  end
end
end
