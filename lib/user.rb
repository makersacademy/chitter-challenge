class User
  attr_accessor :id, :name, :username, :email, :password, :peeps

  def initialize
    @peeps = []
  end
end
