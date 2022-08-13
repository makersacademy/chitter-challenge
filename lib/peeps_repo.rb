require_relative 'users'

class PeepRepository
  
  def all
    peeps = []

    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.map do |peep|
      new_peep = Peeps.new
      new_peep.id = peep['id'].to_i
      new_peep.content = peep['content']
      new_peep.date = peep['date']
      new_peep.user_id = peep['user_id']

      peeps.push(new_peep)
    end

    return peeps
  end

  def find(id)
    sql = 'SELECT id, content, date, user_id FROM peeps WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    peep = Peeps.new
    peep.id = result_set[0]['id'].to_i
    peep.content = result_set[0]['content']
    peep.date = result_set[0]['date']
    peep.user_id = result_set[0]['user_id']

    return peep
  end

  def create(peep)
    sql = 'INSERT INTO peeps (id, content, date, user_id) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql, [peep.id, peep.content, peep.date, peep.user_id])

    return peep
  end

  def delete(id)
    sql = 'DELETE FROM peeps WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
  end

end