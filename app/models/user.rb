require 'bcrypt'

class User
  include DataMapper::Resource


  property :id, Serial

  property :email, String, required: true,
                           unique: true,
                           format: :email_address,
                           messages:
                              { presence: 'Email can not be blank',
                                is_unique: 'Email already registered',
                                format: 'Invalid email format' }

  property :name, String

  property :username, String, required: true,
                              unique: true,
                              messages:
                                 { presence: 'Username can not be blank',
                                   is_unique: 'Username taken' }

  property :password, BCryptHash, required: true,
                                  messages:
                                     { presence: 'Password can not be blank' }

  attr_accessor :password_confirmation
  validates_confirmation_of :password
  validates_length_of :password_confirmation, min: 6,
                                              message: 'Password must be at least 6 characters'

  def self.authenticate(username, password)
    user = User.first(username: username)
    user && user.password == password ? user : nil
  end



end
