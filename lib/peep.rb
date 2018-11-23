require './database_connection_setup'

class Peep
  attr_reader :id, :user_id, :time, :content

  def initialize(id:, user_id:, time:, content:)
    @id = id
    @user_id = user_id
    @time = time
    @content = content
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")

    result.map { |peep| Peep.new(id: peep['id'], user_id: peep['user_id'], time: peep['time_stamp'], content: peep['peep']) }
  end

  def self.create(user_id:, content:)
    result = DatabaseConnection.query("INSERT INTO peeps (user_id, peep) VALUES('#{user_id}', '#{content}') RETURNING id, user_id, time_stamp, peep")

    Peep.new(id: result[0]['id'], user_id: result[0]['user_id'], time: result[0]['time_stamp'], content: result[0]['peep'])
  end
end
