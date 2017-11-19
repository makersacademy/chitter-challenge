require 'bcrypt'
require 'data_mapper'

class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password
  validates_format_of :email, as: :email_address

  property :id, Serial
  property :name, String, required: true
  property :digest, Text, required: true
  property :handle, String, unique: true, required: true
  property :email, Text, unique: true, required: true
  has n, :peeps, 'Peep', child_key: ['poster_id']
  has n, :mentions
  has n, :peeps_mentioned, 'Peep', through: :mentions, via: :peep

  def password=(password)
    @password = password
    self.digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = User.first(email: email)
    if user && (BCrypt::Password.new(user.digest) == password)
      user
    else
      nil
    end
  end

  def to_html
    "<a class=\"user\" href=\"/peeps/users/#{@id}\">@#{@handle}</a>"
  end
end
