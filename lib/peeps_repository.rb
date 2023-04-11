require_relative 'peeps'

class PeepRepository
  def all
    peeps = []

    sql = 'SELECT * FROM peeps ORDER BY created_at DESC;'
    result = DatabaseConnection.exec_params(sql, [])

    result.each do |peep|
      peep = Peep.new
      peep.id = peep['id'].to_i
      peep.content = peep['content']
      peep.user_id = peep['user_id'].to_i

      peeps << peep
    end

    return peeps
  end
end
