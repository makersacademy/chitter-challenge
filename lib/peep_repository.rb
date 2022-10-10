require_relative 'peep'

class PeepRepository
  def all
    sql = 'SELECT id, content, time, user_id FROM peeps;'
    params = []
    result_set = DatabaseConnection.exec_params(sql, params)

    peeps = []
        
    result_set.each do |record|
      peeps << object_to_peep(record)
    end
    return peeps
  end

  def find(id)
    sql = 'SELECT id, content, time, user_id FROM peeps WHERE id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)

    object_to_peep(result[0])
  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, time, user_id) VALUES ($1, $2, $3);'
    result = DatabaseConnection.exec_params(sql, [peep.content, peep.time, peep.user_id])

    return peep
  end

  def object_to_peep(record)
    peep = Peep.new
    peep.id = record['id'].to_i
    peep.content = record['content']
    peep.time = record['time']
    peep.user_id = record['user_id'].to_i
        
    return peep
  end
end
