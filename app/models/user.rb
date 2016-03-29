class User
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String, required: true
  property :username, String, required: true, unique: true,
            messages: {
              presence:   "We need a username",
              is_unique:  "Username already exists!"
             }

  property :email,    String, required: true, unique: true,
            format:   :email_address,
            messages: {
              presence:   "We need an email address",
              is_unique:  "Email already exists!",
              format:     "Incorrecto formato"
             }

  property :password, BCryptHash, required: true


  has n, :peeps, through: Resource

  def self.authenticate(username, password)
    user = first(username: username)

    if user && BCrypt::Password.new(user.password) == password
      user
    else
      nil
    end
  end
end
