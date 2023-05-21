class User
  attr_accessor :id, :name, :username , :email_address, :password_hash

  def initialize(id: nil, name: nil, username: nil, email_address: nil, password_hash: nil)
    @id = id
    @name = name
    @username = username
    @email_address = email_address
    @password_hash = password_hash
  end
end
