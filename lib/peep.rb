require 'PG'

class Peep
  attr_reader :peep_id, :peep, :user, :timestamp

  def initialize(id:, peep:, user:, timestamp:)
    @peep_id = id
    @peep = peep 
    @user = user
    @timestamp = timestamp
  end
    
  def self.add(peep, user)
    results = DatabaseConnection.connection.exec_params("
      INSERT INTO peeps (peep, user_fk, datetime) 
      VALUES ($1, $2, CURRENT_TIMESTAMP) 
      RETURNING peep_id, peep, user_fk, datetime;", [peep, user])
    Peep.new(
      id: results[0]['peep_id'], 
      peep: peep, 
      user: user, 
      timestamp: results[0]['datetime'])
  end

  def self.all
    results = DatabaseConnection.query('SELECT * FROM peeps ORDER BY peep_id DESC;')
    @peeps = results.map { |result| Peep.new(
      id: result['peep_id'], 
      peep: result['peep'], 
      user: result['user_fk'], 
      timestamp: result['datetime'])
    }
  end  
end
