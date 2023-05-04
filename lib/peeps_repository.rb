require_relative 'peeps'
require 'pg'
require_relative './database_connection'

class PeepsRepository
  def initialize(chitter_database)
    @chitter_database = chitter_database
  end
  
  def all
    query = "SELECT * FROM peeps ORDER BY time_of_peep DESC"
    result = DatabaseConnection.query(query)
    result.map do |peep|
      Peep.new(id: peep['id'], peep_content: peep['peep_content'], user_id: peep['user_id'], time_of_peep: peep['time_of_peep'])
    end
  end
  

    def create(peep)
      sql = 'INSERT INTO peeps (peep_content, user_id, time_of_peep) VALUES ($1, $2, $3) RETURNING *;'
      result = DatabaseConnection.exec_params(sql, [peep.peep_content, peep.user_id, peep.time_of_peep])
      Peep.new(id: result[0]['id'], peep_content: result[0]['peep_content'], user_id: result[0]['user_id'], time_of_peep: result[0]['time_of_peep'])
    end
  end
  

  

  def all_with_users
    query = "SELECT p.*, u.username FROM peeps p INNER JOIN users u ON p.user_id = u.id ORDER BY time_of_peep DESC"
    result = DatabaseConnection.query(query)
    result.map do |peep|
      user = User.new(username: peep['username'])
      Peep.new(
        id: peep['id'],
        peep_content: peep['peep_content'],
        time_of_peep: Time.parse(peep['time_of_peep']),
        user_id: peep['user_id'],
        user: user
      )
    end
  end
  
  
  
  

  def find(id)
    query = "SELECT p.*, u.username FROM peeps p INNER JOIN users u ON p.user_id = u.id WHERE p.id = $1"
    result = DatabaseConnection.exec_params(query, [id])
    if result.any?
      peep = Peep.new(id: result[0]['id'], content: result[0]['content'], user_id: result[0]['user_id'], time_of_peep: result[0]['time_of_peep'], user: result[0]['username'])
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
