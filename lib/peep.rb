class Peep
  attr_reader :peep, :username, :post_time

  def initialize(peep:, username: 'TestUser', post_time:)
    @peep = peep
    @username = username
    @post_time = post_time
  end
end
