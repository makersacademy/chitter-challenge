require_relative 'peep'
require_relative 'database_connection'

class PeepRepository
  def all
    sql = 'SELECT id, content, time, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = []
    result_set.each do |record|
      peeps << record_to_peep_object(record)
    end
    
    return peeps
  end

  def find(id)
    sql = 'SELECT id, content, time, user_id FROM peeps
          WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    return record_to_peep_object(result_set[0])
  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, time, user_id)
          VALUES ($1, $2, $3);'
    params = [
      peep.content,
      peep.time,
      peep.user_id
    ]
    DatabaseConnection.exec_params(sql, params)
    return nil
  end

  private

  def record_to_peep_object(record)
    peep = Peep.new
    peep.id = record['id'].to_i
    peep.content = record['content']
    peep.time = record['time']
    peep.user_id = record['user_id'].to_i
    return peep
  end
end
