class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id,              Serial
  property :name,            String, required: true
  property :user_name,       String, required: true, unique: true
  property :email,           String, format: :email_address, required: true, unique: true
  property :password_digest, Text, required: true

  validates_confirmation_of :password

  has n, :peeps

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(user_name: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    end
  end

end
