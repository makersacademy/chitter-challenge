class User

  attr_reader :name, :username, :email
  
  def initialize(name:, username:, email:)
    @name = name
    @username = username
    @email = email
  end
end