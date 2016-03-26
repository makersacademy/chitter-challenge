class Maker
  include DataMapper::Resource
  include BCrypt
  attr_reader   :password
  attr_accessor :password_confirmation

  def password=(new_password)
    @password = new_password
    self.password_hash = Password.create(new_password)
  end

  property :id,            Serial
  property :name,          String
  property :username,      String,
            unique: true,
            messages: {
              is_unique: "Someone else beat you to this incredible username. Sorry."
            }
  property :email,         String,
            unique: true,
            messages: {
              is_unique: "You've already signed up with this email.",
              presence:  "Seriously. Gotta put in an email address.",
              format:    "Does that look like an email addres to you!?"
            }
  property :password_hash, Text

validates_confirmation_of :password,
  message: "Your passwords don't match!"

# validates_uniqueness_of :email
# validates_uniqueness_of :username
end
