require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, String, length: 60
  property :name, String
  property :user_name, String

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  # Now let's set up a connection with a database
  DataMapper.setup(:default, "postgres://localhost/chitter")
  # Let's check that everything we wrote in our models was OK
  DataMapper.finalize
  # And let's build any new columns or tables we added
  DataMapper.auto_upgrade!

end
