require_relative './peep'
require_relative 'database_connection'


class PeepRepository
  def all 
    sql = "SELECT * FROM peeps ORDER BY post_time DESC"
    peeps = []
    result = DatabaseConnection.exec_params(sql, [])
    result.map do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.post_time = record['post_time']
      peep.user_id = record['user_id'].to_i
      peeps << peep
    end
    return peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, post_time, user_id) VALUES ($1, $2, $3) RETURNING id'
    params = [peep.content, peep.post_time, peep.user_id]
    results = DatabaseConnection.exec_params(sql, params)
    peep.id = results.first['id'].to_i
    return peep
  end

  def find(id)
    sql = 'SELECT * FROM peeps WHERE id = $1'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)
    result = result_set[0]
    peep = Peep.new
    peep.id = result['id'].to_i
    peep.content = result['content']
    peep.post_time = result['post_time']
    peep.user_id = result['user_id'].to_i
    peep
  end
end
