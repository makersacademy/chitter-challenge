require_relative 'peeps'
require_relative 'user'
require_relative 'user_repository'

class PeepsRepository

  def initialize(repo)
    @user_repo = repo
  end


  def all
    query = "SELECT * FROM peeps ORDER BY time_of_peep DESC"
    result = DatabaseConnection.query(query)
    result.map do |peep|
      user = @user_repo.find(peep['user_id'].to_i) # Convert the user_id to an integer
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
      peep_data = result[0]
      Peep.new(
        id: peep_data['id'],
        peep_content: peep_data['peep_content'],
        user_id: peep_data['user_id'],
        time_of_peep: peep_data['time_of_peep'],
        username: peep_data['username']
      )
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
  
  
  def find(id)
    query = "SELECT p.*, u.username FROM peeps p INNER JOIN users u ON p.user_id = u.id WHERE p.id = $1"
    result = DatabaseConnection.exec_params(query, [id])
    if result.any?
      peep = Peep.new(id: result[0]['id'], peep_content: result[0]['peep_content'], user_id: result[0]['user_id'], time_of_peep: result[0]['time_of_peep'], username: result[0]['username'])
      peep
    else
      nil
    end
  end
  
  # def delete(id)
  #   sql = 'DELETE from peeps WHERE id = $1;'
  #   sql_params = [id]
  #   DatabaseConnection.exec_params(sql, sql_params)
  # end
end
