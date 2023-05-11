class User
  attr_accessor :id, :email, :password, :name, :username, :peeps, :logged_in
  def initialize
    @logged_in = false
    @peeps = []
  end
end
