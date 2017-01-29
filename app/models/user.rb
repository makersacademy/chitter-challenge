require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  # validates_presence_of :user_email # This DataMapper validation will prevent the model from saving if the email is blank.
  validates_format_of :user_email, as: :email_address

  property :id, Serial
  property :user_email, String, required: true, unique: true, #DB level constraint to ensure this field is NOT NULL, unique to ensure only unique email addresses allowed
    :format   => :email_address,
    :messages => {
        :presence  => "Email must not be blank",
        :is_unique => "We already have that email",
        :format    => "Email has an invalid format"
    }
  property :user_full_name, String
  property :user_name, String
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(user_email, password)
    user = first(user_email: user_email)
    if user && BCrypt::Password.new(user.password_digest) == password
      # return this user
      user
    else
      nil
    end
  end


end


DataMapper.setup(:default, 'postgres://localhost/chitter_development')
DataMapper.finalize
DataMapper.auto_upgrade!
