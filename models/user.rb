require 'bcrypt'
require 'data_mapper'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :handle, String
  property :email, String, :unique => true
  property :password_digest, Text

  has n, :peeps

  def password=(pass)
    self.password_digest = BCrypt::Password.create(pass)
  end

  def self.create(name, handle, email, password)
    @email = email
    return if duplicate_email?
    new_user(name, handle, email, password)
    return @user
  end

  def self.new_user(name, handle, email, password)
    @user = User.new(name: name, handle: handle, email: email)
    @user.password = password
    @user.save!
  end

  def self.login(params)
    @user = User.first(email: params[:email])
    if @user && BCrypt::Password.new(@user.password_digest) == params[:password]
      return @user
    else
      return nil
    end
  end

  def self.duplicate_email?
    User.count(:conditions => ['email = ?', @email]) > 0
  end

end
