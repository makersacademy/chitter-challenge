class PeepRepository

  def all
    peeps = []
    # Executes the SQL query:
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

end