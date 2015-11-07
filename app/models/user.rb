class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String,
            unique: true,
            required: true,
            format: :email_address,
            messages: {
              is_unique:  'Email already registered',
              presence:   'Email address required',
              format:     'Email format invalid'
            }
  property :password, BCryptHash
  property :name, String
  property :username, String


  def self.validate(email, password)
    user = User.first(email: email)
    BCrypt::Password.new(user.password) == password ? user : nil
  end
end