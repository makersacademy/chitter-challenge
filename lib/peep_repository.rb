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
    # adds a peep object to the peep table
  end
end