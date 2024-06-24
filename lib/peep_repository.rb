require_relative "./peep"

class PeepRepository
  def initialize
  end

  def all
    query = 'SELECT * FROM peeps;'
    peeps = []
    result_set = DatabaseConnection.exec_params(query, [])
    result_set.each do |record| 
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.date = record['date']
      peep.time = record['time']
      peep.user_id = record['user_id'].to_i
      peeps << peep
    end
    return peeps
  end
  
  def find(id)
    raise "id must be an Integer" unless id.class == Integer
    query = 'SELECT * FROM peeps WHERE id = $1;'
    record = DatabaseConnection.exec_params(query, [id])
    peep = Peep.new
    peep.id = record[0]['id'].to_i
    peep.content = record[0]['content']
    peep.date = record[0]['date']
    peep.time = record[0]['time']
    peep.user_id = record[0]['user_id'].to_i
    return [peep]
  end

  def create(peep) # peep is an instance of Peep class
    query = 'INSERT INTO peeps (content, date, time, user_id) VALUES ($1, $2, $3, $4);'
    sql_params = [peep.content, peep.date, peep.time, peep.user_id]
    DatabaseConnection.exec_params(query, sql_params)
    return nil
  end

  def delete(id)
    query = 'DELETE FROM peeps WHERE id = $1;'
    DatabaseConnection.exec_params(query, [id])
    return nil
  end
end