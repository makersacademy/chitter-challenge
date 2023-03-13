class User
  attr_accessor :id, :fullname, :username, :email, :password, :peeps
  def initialize
    @peeps = []
  end
end
