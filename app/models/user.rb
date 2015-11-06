
class User
  include DataMapper::Resource

  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String,
    required: true,
    unique: true,
    format: :email_address,
    messages: {
      presence: 'Please enter your email address',
      is_unique: 'Already registered',
      format:   'Please enter a valid email address'
    }
    property :name, String,
      required: true,
    messages: {
      presence: 'Please enter your name'
    }
    property :username, String,
      required: true,
      unique: true,
      messages: {
        presence: 'Please enter your email address',
        is_unique: 'Already registered'
    }

    property :password, BCryptHash

  validates_confirmation_of :password
  validates_format_of :email => :email_address
  validates_presence_of :email
  validates_uniqueness_of :email
end
