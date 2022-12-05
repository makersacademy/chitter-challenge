require_relative 'peep'

class PeepRepository
  def all
    peeps = []

    sql = 'SELECT id, username, content, datetime FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|

      peep = Peep.new
      peep.id = record['id'].to_i
      peep.username = record['username']
      peep.content = record['content']
      peep.datetime = record['datetime']

      peeps << peep
    end

    return peeps
  end

  def find(id)
    sql = 'SELECT id, username, content, datetime FROM peeps WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    peep = Peep.new
    peep.id = result_set[0]['id'].to_i
    peep.username = result_set[0]['username']
    peep.content = result_set[0]['content']
    peep.datetime = result_set[0]['datetime']

    return peep
  end

  def create(peep)
    sql = 'INSERT INTO peeps (username, content, datetime) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [peep.username, peep.content, peep.datetime])

    return peep
  end

end
