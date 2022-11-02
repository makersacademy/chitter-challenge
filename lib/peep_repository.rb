require_relative './peep'

class PeepRepository

  def all
    sql = 'SELECT id, title, content, time, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    peeps = []

    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.title = record['title']
      peep.content = record['content']
      peep.time = record['time']
      peep.user_id = record['user_id']

      peeps << peep
    end
    return peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps (title, content, time, user_id) VALUES ($1, $2, $3, $4);'
    sql_params = [peep.title, peep.content, peep.time, peep.user_id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end
end
