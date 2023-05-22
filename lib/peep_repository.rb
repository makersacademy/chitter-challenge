require_relative './peep'

class PeepRepository 
  def all
    peeps = []
    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      peeps << record_to_peep(record)
    end
  
    return peeps.sort_by(&:time).reverse
  end

  def add(peep)
    sql = 'INSERT INTO peeps (time, contents, account_id) VALUES ($1, $2, $3);'
    sql_params = [peep.time, peep.contents, peep.account_id]

    DatabaseConnection.exec_params(sql, sql_params)
  end

  private 

  def record_to_peep(record)
    peep = Peep.new
    peep.time = record['time']
    peep.contents = record['contents']
    peep.account_id = record['account_id'].to_i

    return peep
  end
end
