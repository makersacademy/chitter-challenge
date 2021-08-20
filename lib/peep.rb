require 'PG'

class Peep
  attr_reader :id, :peep, :user, :timestamp

  def initialize(id:, peep:, user:, timestamp:)
    @id = id
    @peep = peep 
    @user = user
    @timestamp = timestamp
  end
    
  def self.add(peep, user)
    connect_db
    results = @connection.exec_params("INSERT INTO peeps (peep, user_fk, datetime) VALUES ($1, $2, CURRENT_TIMESTAMP) RETURNING peep_id, peep, user_fk, datetime;", [peep, user])
    Peep.new(id: results[0]['peep_id'], peep: peep, user: user, timestamp: results[0]['datetime'])
  end

  def self.all
    connect_db
    results = @connection.exec('SELECT * FROM peeps ORDER BY peep_id DESC;')
    @peeps = results.map { |result| Peep.new(id: result['peep_id'], peep: result['peep'], user: result['user_fk'], timestamp: result['datetime'])}
  end  

  private

  def self.connect_db
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end
end
