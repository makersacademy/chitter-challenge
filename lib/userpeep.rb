require_relative 'database_connection'
require_relative 'peep'
require_relative 'user'

class UserPeep

  attr_reader :user_id, :peep_id

  def initialize(user_id:, peep_id:)
    @user_id = user_id
    @peep_id = peep_id
    @@content_handle_pairs = []
  end

  def self.create(user_id:, peep_id:)
    result = DatabaseConnection.query("INSERT INTO userspeeps (user_id, peep_id) VALUES ('#{user_id}', '#{peep_id}') RETURNING user_id, peep_id;")
    UserPeep.new(user_id: result[0]['user_id'], peep_id: result[0]['peep_id'])
  end

  def self.all
    UserPeep.user_peeps_populate
    UserPeep.peeps_populate
    UserPeep.users_populate
    @@content_handle_pairs
  end

  # private

  def self.user_peeps_populate
    userpeeps = DatabaseConnection.query("SELECT * FROM userspeeps;")
    userpeeps.map do |userpeep|
      UserPeep.new(user_id: userpeep['user_id'], peep_id: userpeep['peep_id'])
    end
    userpeeps.each do |userpeep|
      @@content_handle_pairs << [userpeep['user_id'], userpeep['peep_id'], nil]
    end
  end

  def self.users_populate
    users = DatabaseConnection.query("SELECT * FROM users;").map do |user|
      new_user = User.new(user_id: user['id'], name: user['name'], email: user['email'], handle: user['handle'])
      @@content_handle_pairs.map do |pair|
        if pair[0] == new_user.user_id
          pair[0] = new_user.handle  
        end
      end
    end
  end

  def self.peeps_populate
    peeps = DatabaseConnection.query("SELECT * FROM peeps;").map do |peep|
      new_peep = Peep.new(id: peep['id'], content: peep['content'], time: peep['time'])
      @@content_handle_pairs.map do |pair|
        if pair[1] == new_peep.id
          pair[1] = new_peep.content
          pair[2] = new_peep.time
        end
      end
    end
  end

end