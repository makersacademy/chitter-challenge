class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :username, String, required: true
  property :email, String, format: :email_address, required: true
  property :password_digest, Text

  has n, :peeps

  validates_confirmation_of :password, :message => "Password and password confirmation don't match!"
  validates_uniqueness_of :username, :message => "Username already taken!"
  validates_uniqueness_of :email, :message => "Email address is already registered!"

  attr_accessor :password_confirmation
  attr_reader :password

  def password=(password)
    @password=password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
