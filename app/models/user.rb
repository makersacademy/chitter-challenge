class User
  include DataMapper::Resource

  has n, :posts, through: Resource

  property :id,       Serial
  property :username, String
  property :name,     String
  property :email,    Text, :format => :email_address
  property :password, BCryptHash, length: 255

  def self.authenticate(email, password)
      user = first(email: email)
      if user && BCrypt::Password.new(user.password) == password
        user
      else
        nil
      end
  end

end
