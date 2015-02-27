class User

  attr_reader :message

  # TODO
  # include DataMapper::Resource
  # property :id
  # property :name 
  # property :email
  # property :password
  # property :password_confirmation

  def initialize(message)
    @message = message
  end
  
end