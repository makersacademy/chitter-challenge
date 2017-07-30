class User

  include DataMapper::Resource
  property :id, Serial
  property :name, String, required: true
  property :user_name, String, required: true
  property :email_address, String, required: true
  property :password_digest, Text, required: true
  validates_confirmation_of :password, :message => 'Password do not match'

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

end
