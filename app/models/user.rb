require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :email, String, required: true
  property :username, Text, required: true
  property :password_digest, Text
  #property :name, Text


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  attr_reader :password

  validates_uniqueness_of :email
  validates_uniqueness_of :username


  def self.authenticate(username, password)
    @user = User.first(username: username)

    if @user && BCrypt::Password.new(@user.password_digest) == password
      @user
    else
      nil
    end
  end


end