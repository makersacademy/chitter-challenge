class Peep
  attr_reader :user, :handle, :message
  @@all = []

  def initialize(user:, handle:, message:)
    @user = user
    @handle = handle
    @message = message
    @@all << self
  end

  def self.all
    @@all
  end
end