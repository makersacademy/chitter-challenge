class Feed
  def self.add(user, peep)
    result = DatabaseConnection.query("INSERT INTO feed (user_id, peep_id) 
                                      VALUES ('#{user.id}', '#{peep.id}') RETURNING id")
    Feed.new(result[0]['id'], user, peep)
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM feed ORDER BY id DESC")
    result.map do |feed_entry| 
      user_instance = User.find(feed_entry['user_id'])
      peep_instance = Peep.find(feed_entry['peep_id'])
      Feed.new(feed_entry['id'], user_instance, peep_instance) 
    end
  end

  attr_reader :id, :user, :peep

  def initialize(id, user, peep)
    @id = id
    @user = user
    @peep = peep
  end
end
