class User

  include DataMapper::Resource
  require 'bcrypt'

  attr_accessor :password_confirmation
  attr_reader   :password

  validates_uniqueness_of   :user_name,:message => "User name taken"  
  validates_confirmation_of :password, :message => "Password and confirmation password do not match"
  validates_presence_of     :password, :message => "Password required"
  validates_presence_of     :email,    :message => "Email required"
  validates_presence_of     :user_name,:message => "User_name required"

  property :id,              Serial
  property :name,            String
  property :user_name,       String
  property :email,           String
  property :password_digest, Text

  has n, :peeps

  def password= password
    @password = password

    self.password_digest = BCrypt::Password.create password
  end

  def self.authenticate params
    user = User.first(params[:user_name])

    if user && BCrypt::Password.new(user.password_digest) == params[:password]
      user
    else
      nil
    end
  end
  
end