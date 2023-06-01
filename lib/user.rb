class User
  attr_accessor :id, :email, :password, :name, :username, :peeps
  def initialize
    @peeps = []
  end
end
