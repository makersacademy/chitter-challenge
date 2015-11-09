class User
  include DataMapper::Resource

  attr_accessor :password_confirmation
  has n, :peeps

  property :id, Serial
  property :email, String, required: true, unique: true, format: :email_address
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :password, BCryptHash

  validates_confirmation_of :password
  validates_format_of email:  :email_address
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.authenticate(email:, password:)
    user = User.first(email: email)
    user && BCrypt::Password.new(user.password) == password ? user : nil
  end
end
