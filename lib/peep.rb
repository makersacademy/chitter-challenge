class Peep 

  attr_reader :user_id, :peep, :timestamp

  def initialize(user_id:, peep:, timestamp:)
    @user_id = user_id
    @peep = peep
    @timestamp = timestamp
  end

  def self.create(user_id:, peep:)
    sql = "INSERT INTO peeps (user_id, peep) VALUES ('#{user_id}', '#{peep}') RETURNING id, user_id, peep, peep_time"
    
    result = DatabaseConnection.query(sql).first
    
    Peep.new(user_id: result['user_id'], peep: result['peep'], timestamp: result['peep_time'])
  end

  def self.all
    result = DatabaseConnection.query("Select * FROM peeps")
    result.map { |peep| Peep.new(user_id: peep['user_id'], peep: peep['peep'], timestamp: peep['timestamp'])}
  end

end