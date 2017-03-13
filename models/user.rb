require 'bcrypt'

class User
  # include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :name, String
  property :email, String
  property :password_digest, Text

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  def password=(password)
    # @password = Password.create(new_password)
    self.password_digest = BCrypt::Password.create(password)
  end

  # def create
  #   @user = User.new(params[:username])
  #   @user.password = params[:password]
  #   @user.save!
  # end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      give_token
    else
      redirect_to_home_url
    end
  end
end
