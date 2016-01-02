require 'data_mapper'
require 'dm-postgres-adapter'

# This class corresponds to a table in the database
# We can use it to manipulate the data
class User

  # adds datamapper functionality to this class
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  # these property declarations set the column headers in the Link table
  property :id, Serial
  property :email, String, unique: true, format: :email_address, required: true
  property :password_digest, Text
  property :name, String
  property :username, String, unique: true, required: true

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_presence_of :email
  validates_format_of :email, as: :email_address
  validates_confirmation_of :password



end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
