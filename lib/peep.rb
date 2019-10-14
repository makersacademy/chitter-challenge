require_relative 'database_connection'

class Peep

  attr_reader :id, :time, :peep, :user_id

  def initialize(id:, time:, peep:, user_id:)
    @id  = id
    @time = time
    @peep = peep
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |a_peep|
      Peep.new(id: a_peep['id'], time: a_peep['time'], peep: a_peep['peep'], user_id: a_peep['user_id'])
    end
  end

  def self.create(peep:, user_id:)
    time = Time.now
    result = DatabaseConnection.query("INSERT INTO peeps (peep, time, user_id) VALUES('#{peep}', '#{time}', '#{user_id}') RETURNING id, peep, time, user_id;")
    Peep.new(id: result[0]['id'], time: result[0]['time'], peep: result[0]['peep'], user_id: result[0]['user_id'])
  end
end
