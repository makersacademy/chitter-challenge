class User

  include DataMapper::Resource
  property :id, Serial
  property :name, String, required: true
  property :user_name, String, required: true
  property :email_address, String, format: :email_address, required: true
  property :password_digest, Text, required: true
  validates_confirmation_of :password, :message => 'Passwords do not match'

  has n, :peeps

  attr_reader :password
  attr_accessor :password_confirmation

  def count
    User.count
  end

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def self.authenticate(email_address, password)
    user = first(email_address: email_address)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
