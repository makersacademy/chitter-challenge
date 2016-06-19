require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id,               Serial
  property :email,            String, format: :email_address, required: true, unique: true
  property :handle,           String, required: true, unique: true
  property :password_digest,  Text, length: 60

  # has n, :peeps, 'Peep',
  #   :parent_key => [ :handle ],      # local to this model (User)
  #   :child_key  => [ :user_handle ]  # in the remote model (Peep)

  has n, :peeps


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  validates_confirmation_of :password

end
