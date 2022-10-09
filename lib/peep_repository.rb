require_relative 'peep'

class PeepRepository
  def all(text)
    peeps = []
    sql = "SELECT peeps.id, peeps.content, peeps.time, users.username
    FROM peeps JOIN users
    ON users.id = peeps.user_id #{text}"
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
      peeps << record_to_peep_object(record)
    end
  
    return peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, time, user_id) VALUES ($1, $2, $3);'
    sql_params = [peep.content, peep.time, peep.user_id]
    DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end

  def find(id)
    sql = "SELECT id, content, time, user_id FROM peeps WHERE id = $1;"
    records = DatabaseConnection.exec_params(sql, [id])
    record_to_peep_object(records[0])
  end

  private

  def record_to_peep_object(record)
    peep = Peep.new
    peep.id = record['id'].to_i
    peep.content = record['content']
    peep.time = record['time']
    peep.user_id = record['username']
    
    peep
  end
end