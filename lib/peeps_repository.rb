require_relative 'peeps'
require_relative 'user'
require_relative 'user_repository'

class PeepsRepository

  def initialize(repo)
    @user_repo = repo
    @all_peeps = [] # Initialize an empty array to store all the peeps
  end

  def all
    @all_peeps
  end

  def all
    query = "SELECT * FROM peeps ORDER BY time_of_peep ASC"    
    result = DatabaseConnection.query(query)
    result.map do |peep|
      user = @user_repo.find(peep['user_id'].to_i)
      if user
        Peep.new(id: peep['id'], peep_content: peep['peep_content'], user_id: peep['user_id'], time_of_peep: peep['time_of_peep'], username: user.username)
      end
    end.compact
  end

  def create(peep)
  sql = 'INSERT INTO peeps (peep_content, user_id, time_of_peep) VALUES ($1, $2, $3) RETURNING *;'
  sql_params = [peep.peep_content, peep.user_id, peep.time_of_peep]
  result = DatabaseConnection.exec_params(sql, sql_params)

  if result.any?
    peep.id = result[0]['id'].to_i
    all << peep
    peep
  else
    nil
  end
end

  
  
  
  
  
  public

  def all_with_users
    query = "SELECT p.*, u.username FROM peeps p INNER JOIN users u ON p.user_id = u.id ORDER BY p.time_of_peep DESC"
    result = DatabaseConnection.query(query)
    
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        peep_content: peep['peep_content'],
        user_id: peep['user_id'],
        time_of_peep: peep['time_of_peep'],
        username: peep['username']
      )
    end
  end

  def all_with_users_and_comments
    query = "SELECT p.*, u.username, c.id AS comment_id, c.comment_content, c.user_id AS comment_user_id, c.peep_id, c.time_of_comment
             FROM peeps p
             INNER JOIN users u ON p.user_id = u.id
             LEFT JOIN comments c ON p.id = c.peep_id
             ORDER BY p.time_of_peep DESC"

    result = DatabaseConnection.query(query)

    peeps = []
    current_peep = nil

    result.each do |row|
      if current_peep.nil? || current_peep.id != row['id']
        user = @user_repo.find(row['user_id'].to_i)
        current_peep = Peep.new(
          id: row['id'],
          peep_content: row['peep_content'],
          user_id: row['user_id'],
          time_of_peep: row['time_of_peep'],
          username: user.username,
          comments: []
        )
        peeps << current_peep
      end

      if row['comment_id']
        comment = Comment.new(
          id: row['comment_id'],
          comment_content: row['comment_content'],
          user_id: row['comment_user_id'],
          peep_id: row['peep_id'],
          time_of_comment: row['time_of_comment']
        )
        current_peep.comments << comment
      end
    end
    peeps
  end

  def find(id)
    puts id.inspect # Add this line to see the value of id
    query = "SELECT p.*, u.username FROM peeps p INNER JOIN users u ON p.user_id = u.id WHERE p.id = $1"
    result = DatabaseConnection.exec_params(query, [id])
    if result.any?
      peep = Peep.new(
        id: result[0]['id'],
        peep_content: result[0]['peep_content'],
        user_id: result[0]['user_id'],
        time_of_peep: result[0]['time_of_peep'],
        username: result[0]['username']
      )
      peep
    else
      nil
    end
  end
  
  
  
  
  def delete(id)
    sql = 'DELETE FROM peeps WHERE id = $1 RETURNING *;'
    sql_params = [id]
    result = DatabaseConnection.exec_params(sql, sql_params)
  end
  

  def update(peep)
    sql = 'UPDATE peeps SET peep_content = $1 WHERE id = $2;'
    sql_params = [peep.peep_content, peep.id]
    result = DatabaseConnection.exec_params(sql, sql_params)
    result.to_a.empty? ? nil : peep
  end

end
