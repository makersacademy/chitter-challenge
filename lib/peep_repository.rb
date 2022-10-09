require_relative 'peep'

class PeepRepository
  def all
    sql = 'SELECT id, timestamp, content, maker_id FROM peeps;'
    results_set = DatabaseConnection.exec_params(sql, [])
    peeps = []
    results_set.each do |record|
      new_peep = Peep.new
      new_peep.id = record['id']
      new_peep.timestamp = record['timestamp']
      new_peep.content = record['content']
      new_peep.maker_id = record['maker_id']
      peeps << new_peep
    end

    return peeps
  end

  def create(peep)
    sql = "INSERT INTO peeps (timestamp, content, maker_id) VALUES 
    ((select date_trunc('second', now())), $1, $2);"
    params = [peep.content, peep.maker_id]
    DatabaseConnection.exec_params(sql, params)

    return nil
  end
end
