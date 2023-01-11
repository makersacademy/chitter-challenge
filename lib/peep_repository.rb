require_relative 'peep'

class PeepRepository

  def all
    sql = 'SELECT * FROM peeps ORDER BY timestamp DESC'
    results = DatabaseConnection.exec_params(sql, [])
    peeps = []
    results.each do |result|
      peep = Peep.new
      peep.id = result['id'].to_i
      peep.content = result['content']
      peep.timestamp = result['timestamp']
      peep.user_id = result['user_id']
      peeps << peep
    end
    peeps
  end

  def create(peep)
    sql = "INSERT INTO peeps (content, timestamp, user_id) VALUES ($1, $2, $3);"
    params = [peep.content, peep.timestamp, peep.user_id]
    DatabaseConnection.exec_params(sql, params)
  end
end
