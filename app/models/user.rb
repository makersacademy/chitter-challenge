class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :username, String, unique: true, required: true
  property :name, String, required: true
  property :email, String, unique: true, required: true
  property :password_digest, String, length: 60

  has n, :peeps

  validates_presence_of :password
  validates_confirmation_of :password

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def self.authenticate(username, password)
    user = User.first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
