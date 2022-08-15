require_relative "./peep"

class PeepRepository

  def all

    sql = 'SELECT * FROM peeps;'
    sql_params = []

    result_set = DatabaseConnection.exec_params(sql,sql_params)

    peeps = []

    result_set.each do |record|
      peep = Peep.new
      peep.id = record["id"]
      peep.content = record["content"]
      peep.timestamp = record["timestamp"]
      peep.user_id = record["user_id"]

      peeps << peep

    end

    return peeps

  end

  def find(id)

    sql = 'SELECT * FROM peeps WHERE id = $1;'
    sql_params = [id]

    result = DatabaseConnection.exec_params(sql,sql_params)

    record = result[0]

    peep = Peep.new 
    peep.id = record["id"]
    peep.content = record["content"]
    peep.timestamp = record["timestamp"]
    peep.user_id = record["user_id"]
    
    return peep

  end

  def create(peep)
    
    sql = 'INSERT INTO peeps (content, timestamp, user_id) VALUES ($1, $2, $3);'
    sql_params = [peep.content, peep.timestamp, peep.user_id]

    DatabaseConnection.exec_params(sql, sql_params)

    return nil  

  end

end