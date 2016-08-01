require 'bcrypt'
class User
  include DataMapper::Resource

  property :id,                         Serial
  property :name,                       String, required: true
  property :email,                      String, required: true, unique: true
  property :user_name,                  String, required: true, unique: true
  property :password_digest,            String, length:   60

  attr_reader   :password
  attr_accessor :password_confirmation

 validates_confirmation_of       :password
 validates_format_of :email, as: :email_address


 def password=(password)
   @password = password
   self.password_digest = BCrypt::Password.create(password)
 end


 def self.authenticate(email, password)
   user = first(email: email)
   return user if (user && BCrypt::Password.new(user.password_digest) == password)
   nil
 end

 has n, :peeps
end
