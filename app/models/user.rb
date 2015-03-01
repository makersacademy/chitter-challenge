class User
  include DataMapper::Resource

  property :id,         Serial
  property :name,       String
  property :username,   String, unique: true
  property :email,      String, unique: true
  property :password,   String

  has n, :cheeps

  def self.authenticate(email, password)
    user = first(email: email)
    if user
      user.password == password ? user : false
    else
      nil
    end
  end

end