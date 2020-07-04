class Peep
  attr_reader :user, :message
  def initialize(message, user)
    @message = message
    @user = user
  end
end
