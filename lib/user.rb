class User
  attr_accessor :id, :email, :password, :name, :username, :peeps, :logged_in
  def initialize
    @logged_in = 'f'
    @peeps = []
  end
end
