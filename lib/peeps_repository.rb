require_relative 'peeps'

class PeepRepository
  def all
    sql = 'SELECT id, content, user_id FROM peeps ORDER BY created_at DESC;'
    result = DatabaseConnection.exec_params(sql, [])
  
    result.map do |peep|
      Peep.new(
        id: peep['id'].to_i,
        content: peep['content'],
        user_id: peep['user_id'].to_i
      )
    end
  end  
end
