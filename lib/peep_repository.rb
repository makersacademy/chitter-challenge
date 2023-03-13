require_relative './peep'

class PeepRepository
  def all
    sql = 'SELECT id, timestamp, content, maker_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = []

    result_set.each { |peep|
      new_peep = Peep.new
      new_peep.id = peep['id'].to_i
      new_peep.timestamp = peep['timestamp']
      new_peep.content = peep['content']
      new_peep.maker_id = peep['maker_id'].to_i

      peeps << new_peep
    } 
    return peeps
  end


  def create(peep)
    sql = 'INSERT INTO peeps (timestamp, content, maker_id) VALUES ($1, $2, $3);'
    sql_params = [peep.timestamp, peep.content, peep.maker_id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    return peep
  end
end