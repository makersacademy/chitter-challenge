require_relative 'peep'

class PeepRepository
  def all
    sql = 'SELECT * FROM peeps ORDER BY time DESC;'
    result = DatabaseConnection.exec_params(sql, [])
    peeps = []
    result.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.time = record['time']
      peep.user_id = record['user_id']
      peeps.push(peep)
    end
    return peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, time, user_id) VALUES ($1, $2, $3);'
    result = DatabaseConnection.exec_params(sql,[peep.content, peep.time, peep.user_id])
  end
end
