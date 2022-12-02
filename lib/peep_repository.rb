require_relative 'peep'

class PeepRepository
  def all
    peeps = []

    sql = 'SELECT id, message, created_at, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.message = record['message']
      peep.created_at = record['created_at']
      peep.user_id = record['user_id'].to_i

      peeps << peep
    end 
    peeps.sort_by(&:created_at).reverse
  end

  def find(id)
    sql = 'SELECT id, message, created_at, user_id FROM peeps WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    peep = Peep.new
    peep.id = result_set[0]['id'].to_i
    peep.message = result_set[0]['message']
    peep.created_at = result_set[0]['created_at']
    peep.user_id = result_set[0]['user_id']

    return peep
  end

  def create(peep)
    sql = 'INSERT INTO peeps (message, created_at, user_id) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [peep.message, peep.created_at, peep.user_id])

    return peep
  end 
end 
