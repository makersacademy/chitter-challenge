class User
  attr_accessor :id, :name, :username, :email, :password, :peep
  def initialize
    @peeps = []
  end
end