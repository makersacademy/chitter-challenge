require_relative 'peep'

class PeepRepository

  def all
    sql = 'SELECT content, timestamp, user_id, users.username FROM peeps JOIN users ON  user_id = users.id ORDER BY timestamp DESC'
    results = DatabaseConnection.exec_params(sql, [])
    peeps = []
    results.each do |result|
      peeps << process_peep_details(result)
    end
    peeps
  end

  def create(peep)
    sql = "INSERT INTO peeps (content, timestamp, user_id) VALUES ($1, $2, $3);"
    params = [peep.content, peep.timestamp, peep.user_id]
    DatabaseConnection.exec_params(sql, params)
  end

  def find_by_user(id)
    sql = 'SELECT content, timestamp, user_id, users.username FROM peeps JOIN users ON  user_id = users.id WHERE user_id = $1 ORDER BY timestamp DESC'
    params = [id]
    results = DatabaseConnection.exec_params(sql, params)
    peeps = []
    results.each do |result|
      peeps << process_peep_details(result)
    end
    peeps
  end

private

  def process_peep_details(result)
    peep = Peep.new
    peep.id = result['id'].to_i
    peep.content = result['content']
    peep.timestamp = result['timestamp']
    peep.user_id = result['user_id']
    peep.username = result['username']
    peep
  end
end
