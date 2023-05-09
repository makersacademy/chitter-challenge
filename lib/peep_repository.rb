require 'peep'

class PeepRepository 
  def all
    peeps = []

    sql = 'SELECT id, time, contents, account_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|

      peep = Peep.new
      peep.time = record['time']
      peep.contents = record['contents']
      peep.account_id = record['account_id'].to_i


      peeps << peep
    end
    return peeps
  end

  def add(peep)
    sql = 'INSERT INTO peeps (time, contents, account_id) VALUES ($1, $2, $3);'
    sql_params = [peep.time, peep.contents, peep.account_id]

    DatabaseConnection.exec_params(sql, sql_params)

    return peep
  end
end