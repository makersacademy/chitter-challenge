class Users
  attr_reader :id, :email, :name, :handle

  def initialize(id, email, name, handle, password)
    @id = id
    @email = email
    @name = name
    @handle = handle
    @password = password
  end



  private
  attr_reader :password
end