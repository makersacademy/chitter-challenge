require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,           Serial
  property :user_name,    String, :required => true
  property :email,        String, :required => true, :unique => true,
    :format   => :email_address,
    :messages => {
      :presence  => "We need your email address.",
      :is_unique => "This email address is already registered",
      :format    => "Not a valid email address"
    }
  property :password,     BCryptHash, :required => true
  property :created_at,   DateTime
  property :updated_at,   DateTime

  has n, :peeps
  has n, :comments

  def self.authenticate(email, password)
    user = first(:email => email)
    if user
      if user.password != password
        user = nil
      end
    end
    user
  end

end
