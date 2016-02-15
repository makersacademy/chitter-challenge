require_relative '../data_mapper_setup'
 require 'bcrypt'

 class User

   attr_reader :password
   attr_accessor :password_confirmation

   include DataMapper::Resource

   property :id, Serial
   property :name, Text
   property :username, Text,
           :messages => {
              presence:   "Please enter a username address.",
              is_unique:  "Sorry, that usename is not available."
              }
   validates_presence_of :username
   validates_uniqueness_of :username


   property :password_digest, Text
   validates_confirmation_of :password

   property :email, String,
            :format   => :email_address,
            :messages => {
            presence:  "Please enter an email address.",
            is_unique: "We already have that email.",
            format:   "Doesn't look like an email address to me ..."
            }
   validates_presence_of :email
   validates_uniqueness_of :email

   def password=(password)
     @password = password
     self.password_digest = BCrypt::Password.create(password)
   end

   def self.authenticate(username, password)
     user = User.first(username: username)
     user && BCrypt::Password.new(user.password_digest) == password
   end

end
