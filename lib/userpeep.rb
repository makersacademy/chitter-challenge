require_relative 'database_connection'

class UserPeep

  attr_reader :user_id, :peep_id

  def initialize(user_id:, peep_id:)
    @user_id = user_id
    @peep_id = peep_id
  end

  def self.create(user_id:, peep_id:)
    result = DatabaseConnection.query("INSERT INTO userpeeps (user_id, peep_id) VALUES ('#{user_id}', '#{peep_id}') RETURNING user_id, peep_id;")
    Userpeep.new(user_id: result[0]['user_id'], peep_id: result[0]['peep_id'])
  end

end