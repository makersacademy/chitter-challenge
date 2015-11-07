require 'data_mapper'
require 'bcrypt'

class Maker
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, Text

  # Here, we are over-riding what gets stored in our database when we create a new Maker in our
  # controller, i.e. we use Maker.create(password: params[:password]) (using the below password
  # method as our key, instead of Maker.create(password_digest: params[:password]). This results
  #in our password_digest property being saved as an encrypted hash+salt in our database.
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate!
