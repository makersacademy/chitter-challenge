require_relative 'peeps'

class PeepRepository
  def all
    sql = 'SELECT * FROM peeps ORDER BY created_at DESC;'
    result = DatabaseConnection.exec_params(sql, [])

    result.map do |peep|
      new_peep = Peep.new(
        id: peep['id'].to_i,
        content: peep['content'],
        user_id: peep['user_id'].to_i,
        created_at: peep['created_at']
      )

      # Debug statement
      # puts "Peep created_at: #{new_peep.created_at.inspect}"

      new_peep
    end
  end
end



