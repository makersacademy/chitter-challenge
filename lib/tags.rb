
class Tags

  def self.create(id:, tag:)
    usernamecheck = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{tag}';")
    return "Username Not Found" unless usernamecheck.any?
    user = User.find(id: usernamecheck[0]['id'])
    tagcheck = DatabaseConnection.query("SELECT * FROM tags WHERE user_id = '#{user.id}' AND peep_id = '#{id}';")
    return "Already Tagged" if tagcheck.any?

    result = DatabaseConnection.query("INSERT INTO tags (user_id, peep_id) VALUES(#{user.id}, #{id}) RETURNING id, peep_id, user_id;").first
    Tags.new(id: result['id'], user_id: result['user_id'], peep_id: result['peep_id'])
  end

  def self.find(peep_id:)
    result = DatabaseConnection.query("SELECT * FROM tags WHERE peep_id = '#{peep_id}';")
    return false unless result.any?
    Tags.new(id: result[0]['id'], user_id: result[0]['user_id'], peep_id: result[0]['peep_id'])
  end

  attr_reader :id, :user_id, :peep_id

  def initialize(id:, user_id:, peep_id:)
    @id = id
    @user_id = user_id
    @peep_id = peep_id
  end

  def username(user_class = User)
    @user = user_class.find(id: user_id)
    return @user.username
  end

end
