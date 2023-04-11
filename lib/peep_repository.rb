require_relative 'peep'

class PeepRepository
  def all_reversed
    sql = 'SELECT id, message, time, user_id FROM peeps ORDER BY time desc;'
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = []
    result_set.each do |record|
      peep = Peep.new
      peep.id, peep.message = record['id'].to_i, record['message']
      peep.time, peep.user_id = record['time'], record['user_id']
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
