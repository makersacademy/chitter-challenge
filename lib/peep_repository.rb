require_relative 'peep'

class PeepRepository
  def all
    peeps = []
    sql = 'SELECT id, content, peep_date, user_id, tags FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.peep_date = record['peep_date']
      peep.user_id = record['user_id'].to_i
      peep.tags = record['tags']
      peeps << peep
    end
    return peeps
  end

  def find(id)
    sql = 'SELECT id, content, peep_date, user_id, tags FROM peeps WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    peep = Peep.new
    peep.id = result_set[0]['id'].to_i
    peep.content = result_set[0]['content']
    peep.peep_date = result_set[0]['peep_date']
    peep.user_id = result_set[0]['user_id'].to_i
    peep.tags = result_set[0]['tags']
    return peep
  end

  def create(peep)
    sql = 'INSERT INTO peeps (id, content, peep_date, user_id, tags) VALUES ($1, $2, $3, $4, $5);'
    result_set = DatabaseConnection.exec_params(sql, [peep.id, peep.content, peep.peep_date, peep.user_id, peep.tags])
    return peep
  end

  def delete(id)
    sql = 'DELETE FROM peeps WHERE id = $1;';
    DatabaseConnection.exec_params(sql, [id]);
  end
end