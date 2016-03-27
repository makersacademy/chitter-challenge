
class User

  include DataMapper::Resource
  
  attr_reader :password
  validates_format_of :emails, as: :email_address
  
  has n, :poops, through: Resource

  property :id, Serial
  property :email, String, format: :email_address, required: true
  property :password_digest, Text, required: true
  property :name, String, required: true
  property :username, String, required: true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email:email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end


