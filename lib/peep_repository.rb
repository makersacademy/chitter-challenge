require_relative 'peep'

class PeepRepository
  def all
    sql = 'SELECT * FROM peeps ORDER BY timestamp DESC;'
    result_set = DatabaseConnection.exec_params(sql, [])

    peeps = []

    result_set.each do |row|
      peep = Peep.new
      peep.content = row['content']
      peep.timestamp = row['timestamp']
      peep.name = row['name']
      peep.username = row['username']
      peep.user_id = row['user_id']

      peeps << peep
    end
    
    return peeps
  end

  def create(peep)
   
  end
end