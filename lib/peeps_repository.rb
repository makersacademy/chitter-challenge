require_relative 'peeps'
require 'pg'
require_relative './database_connection'

class PeepsRepository
  def initialize(chitter_database)
    @chitter_database = chitter_database
  end

  def all
    query = "SELECT * FROM peeps ORDER BY timestamp DESC"
    result = DatabaseConnection.query(query)
    result.map do |peep|
      Peep.new(id: peep['id'], content: peep['content'], user_id: peep['user_id'], timestamp: peep['timestamp'])
    end
  end

  def create(content, user_id)
    query = "INSERT INTO peeps (content, user_id) VALUES ($1, $2) RETURNING *"
    params = [content, user_id]
    result = DatabaseConnection.exec_params(query, params)
    Peep.new(id: result[0]['id'], content: result[0]['content'], user_id: result[0]['user_id'], timestamp: result[0]['timestamp'])
  end

  def all_with_users
    query = "SELECT p.*, u.username FROM peeps p INNER JOIN users u ON p.user_id = u.id ORDER BY timestamp DESC"
    result = DatabaseConnection.query(query)
    result.map do |peep|
      Peep.new(id: peep['id'], content: peep['content'], user_id: peep['user_id'], timestamp: peep['timestamp'], user: peep['username'])
    end
  end

  # def find(id)
  #   sql = 'SELECT id, peep_content, time_of_peep, user_id FROM peeps WHERE id = $1;'
  #   result_set = DatabaseConnection.exec_params(sql, [id])
  #   record = result_set.first
  #   peep = Peeps.new
  #   peep.time_of_peep = DateTime.parse record['time_of_peep']
  #   peep.peep_content = record['peep_content']
  #   peep.user_id = record['user_id'].to_i
  #   return peep
  # end

  # def create(peep)
  #   sql = "INSERT INTO peeps (peep_content, time_of_peep, user_id) VALUES ($1, $2, $3)"
  #   sql_params = [peep.peep_content, peep.time_of_peep, peep.user_id]
  #   DatabaseConnection.exec_params(sql, sql_params)
  # end

  # def delete(id)
  #   sql = 'DELETE from peeps WHERE id = $1;'
  #   sql_params = [id]
  #   DatabaseConnection.exec_params(sql, sql_params)
  # end
end
