require_relative 'peep'

class PeepRepository
  def all
    sql = 'SELECT id, message, time, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    peeps = []

    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.message = record['message']
      peep.time = record['time']
      peep.user_id = record['user_id']

      peeps << peep
    end
    return peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps (message, time) values ($1, $2)'
    result_set = DatabaseConnection.exec_params(sql, [peep.message, peep.time])

    return peep
  end
end