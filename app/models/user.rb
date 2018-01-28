class User
  include DataMapper::Resource

  attr_accessor :password_confirmation

  property :id,       Serial
  property :email,    String, format: :email_address, required: true, unique: true
  property :password, BCryptHash
  property :name,     String
  property :username, String, unique: true

  validates_confirmation_of :password

  has n, :peeps

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password) == password
      user
    else
      nil
    end
  end
end
