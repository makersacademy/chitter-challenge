require_relative 'peep'

class PeepRepository
  def all
    peeps = []

    sql = 'SELECT id, time, content, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.time = record['time']
      peep.content = record['content']
      peep.user_id = record['user_id']

      peeps << peep
    end

    return peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps (time, content, user_id) VALUES ($1, $2, $3);'
    params = [peep.time, peep.content, peep.user_id]
    result_set = DatabaseConnection.exec_params(sql, params)

    return peep
  end
end
