require_relative 'database_connection'

class UserPeep

  attr_reader :user_id, :peep_id

  def initialize(user_id:, peep_id:)
    @user_id = user_id
    @peep_id = peep_id
  end

  def self.create(user_id:, peep_id:)
    result = DatabaseConnection.query("INSERT INTO userspeeps (user_id, peep_id) VALUES ('#{user_id}', '#{peep_id}') RETURNING user_id, peep_id;")
    UserPeep.new(user_id: result[0]['user_id'], peep_id: result[0]['peep_id'])
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps;")
    users = DatabaseConnection.query("SELECT * FROM users;")
    # get user_id and grab handle from users
    # get peep_id and grab comment & time from users
    result = DatabaseConnection.query("SELECT * FROM userspeeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], content: peep['content'], time: peep['time'])
    end
  end

end