class PeepRepository

  def all
    peeps = []
    sql = 'SELECT id, content, time, maker_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.time = record['time']
      peep.maker_id = record['maker_id'].to_i

      peeps << peep
    end
    return peeps
  end


  def create(peep)
    sql = 'INSERT INTO peeps (content, time, maker_id) VALUES ($1, $2, $3);'
    DatabaseConnection.exec_params(sql, [peep.content, peep.time, peep.maker_id])
  end

end