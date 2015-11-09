require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password

  has n, :peeps

  property :id,               Serial
  property :name,             String,  :required => true, :messages => {
                                      :presence => 'Please enter your name' }
  property :username,         String, :required => true, :unique => true,
                                      :messages =>
                                    { :presence => 'Please enter a username',
                                      :is_unique => 'We already have that username' }
  property :email,            String, :required => true, :unique => true,
                                      :format => :email_address,
                                      :messages => { :presence => 'Please enter an email address',
                                                     :is_unique => 'We already have that email',
                                                     :format => 'Please enter a valid email address' }
  property :password_hash,    Text,   :required => true, :messages => {
                                      :presence => 'Please enter a password' }



  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_hash) == password
       user
    else
       nil
    end
  end
end
