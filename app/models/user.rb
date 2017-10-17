require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :user_name, String
  property :email, String, required: true, unique: true
  property :password_set, Text
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, :as => :email_address
  validates_uniqueness_of(:email)

  def password=(password)
    @password = password
    self.password_set = Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_set) == password
      user
    else
      nil
    end
  end
end
