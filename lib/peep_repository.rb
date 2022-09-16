require_relative 'peep'

class PeepRepository
  def all
    peeps = []

    query = 'select * from peeps;'
    result_set = DatabaseConnection.exec_params(query, [])

    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.peep_time = record['peep_time']
      peep.user_id = record['user_id'].to_i

      peeps << peep
    end
    sorted_peeps = peeps.sort_by{|peep| peep.peep_time}.reverse!
    return sorted_peeps
  end

  def find(id)
    query = 'select * from peeps where id = $1;'
    result_set = DatabaseConnection.exec_params(query, [id])

    peep = Peep.new
    peep.id = result_set[0]['id'].to_i
    peep.content = result_set[0]['content']
    peep.peep_time = result_set[0]['peep_time']
    peep.user_id = result_set[0]['user_id'].to_i

    return peep
  end

  def create(peep)
    query = 'INSERT INTO peeps (content, peep_time, user_id) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(query, [peep.content, peep.peep_time, peep.user_id])

    return peep
  end
end
