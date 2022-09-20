class User
  attr_accessor :id, :email, :password, :name, :username, :mentions

  def initialize
    @password = nil
    @mentions = []
  end
end
