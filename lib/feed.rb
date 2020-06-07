class Feed
  def self.add(user, peep)
    result = DatabaseConnection.query("INSERT INTO feed (user_id, peep_id) VALUES ('#{user.id}', '#{peep.id}') RETURNING id")
    Feed.new(result[0]['id'], user, peep)
  end

  attr_reader :id, :user, :peep

  def initialize(id, user, peep)
    @id = id
    @user = user
    @peep = peep
  end
end