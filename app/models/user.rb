class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, unique: true, format: :email_address
  property :password, BCryptHash
  property :name, String
  property :username, String

  def self.validate(email, password)
    user = User.first(email: email)
    BCrypt::Password.new(user.password) == password ? user : nil
  end
end