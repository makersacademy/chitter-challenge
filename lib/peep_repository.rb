require_relative 'peep'

class PeepRepository
  def all
    sql = 'SELECT * FROM peeps;'
    result = DatabaseConnection.exec_params(sql, [])
    
    peeps = []

    result.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.time = record['time']
      peep.user_id = record['user_id']

      peeps << peep
    end

    return peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, time, user_id) VALUES ($1, $2, $3);'
    params = [peep.content, peep.time, peep.user_id]
    result = DatabaseConnection.exec_params(sql, params)

    return nil
  end
end