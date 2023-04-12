require_relative 'peeps'

class PeepRepository
  def all
    sql = 'SELECT users.name, users.username, peeps.content, peeps.created_at, peeps.user_id
    FROM users
    JOIN peeps
    ON peeps.user_id = users.id
    ORDER BY peeps.created_at DESC;'
    result = DatabaseConnection.exec_params(sql, [])

    result.map do |peep|
      new_peep = Peep.new(
        id: peep['id'].to_i,
        content: peep['content'],
        user_id: peep['user_id'].to_i,
        created_at: peep['created_at'],
        username: peep['username']
      )

      # Debug statement
      # puts "Peep created_at: #{new_peep.created_at.inspect}"

    end
  end

  def create(content:, user_id:)
    sql = 'INSERT INTO peeps (content, user_id) VALUES ($1, $2);'
    DatabaseConnection.exec_params(sql, [content, user_id])
  end
end



