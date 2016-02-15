
require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource


  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :user_name, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, Text

  has n, :peeps
  # has n, :comments, :through => :peeps


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(user_name, password)
    user = first(user_name: user_name)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end


  validates_confirmation_of :password,
  message: 'Dur-brain, you need to type the SAME password twice'

  validates_presence_of :email,
  message: 'Friend, without an email, how can we contact you again?'

  validates_uniqueness_of :email,
  message: 'Friend? Can you not remember that you\'re a member?'

  validates_format_of :email, as: :email_address,
  message:'Friend, something looks a bit fishy about your email'

  validates_presence_of :user_name,
  message: 'You may have forgotten something Brother. Something crucial.'

  validates_uniqueness_of :user_name,
  message: 'We already have a Brother by that name. There can be only one'



end


# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
