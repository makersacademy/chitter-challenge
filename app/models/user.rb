require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial

end
