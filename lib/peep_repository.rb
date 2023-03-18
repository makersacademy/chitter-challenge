require_relative 'peep'

class PeepRepository
  def all_peeps
    peeps = []

    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.datetime = record['datetime']
      peep.user_id = record['user_id']

      peeps << peep
    end
    return peeps
  end

  def find_peep(id)
    sql = 'SELECT * FROM peeps WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    peep = Peep.new
    peep.id = result_set[0]['id']
    peep.content = result_set[0]['content']
    peep.datetime = result_set[0]['datetime']
    peep.user_id = result_set[0]['user_id']

    return peep
  end

  def create_peep(peep)
    sql = 'INSERT INTO peeps (content, user_id) VALUES($1, $2)'
    params = [peep.content, peep.user_id]
    result_set =  DatabaseConnection.exec_params(sql, params)

    return peep
  end

end