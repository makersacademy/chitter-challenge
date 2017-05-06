require 'bcrypt'
require 'data_mapper'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :email, String, :unique => true
  property :password_digest, Text

  def password=(pass)
    self.password_digest = BCrypt::Password.create(pass)
  end

  def self.create(name, email, password)
    @user = User.new(name: name, email: email)
    @user.password = password
    @user.save!
    return @user
  end

  def self.login(params)
    @user = first(email: params[:email])
    if @user && BCrypt::Password.new(@user.password_digest) == params[:password]
      return @user
    else
      nil
    end
  end

end
