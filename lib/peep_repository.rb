require_relative './database_connection.rb'
require_relative './peep.rb'

class PeepRepository
  def all
    peeps = []

    # sql = "SELECT id, content, date, id FROM peeps;"
    sql = "SELECT * FROM peeps;"
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do|record|
      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.date = record['date']
      peep.id = record['user_id']
      peeps << peep
    end
    return peeps
  end
  
    # Gets a single record by its ID
    # One argument: the id (number)

  def add(peep)
      sql = 'INSERT INTO 
      peeps (content, date, id) 
       VALUES ($1, $2, $3);'
      sql_params = [peep.content, peep.date, peep.id]

      DatabaseConnection.exec_params(sql, sql_params)
  end
  
  # def find(id)
  #   sql = "SELECT id, content, date, user_id FROM peeps WHERE id = $1;"
  #   sql_params = [id]

  #   result_set = DatabaseConnection.exec_params(sql, sql_params)
  #   record = result_set[0]
        
  #     peep = peep.new
  #     peep.id = record['id']
  #     peep.title = record['title']
  #     peep.content = record['content']
  #     peep.views = record['views']
  #     peep.user_id = record['user_id']

  #     return peep
  # end

  # def create(peep)
  #     sql = "INSERT INTO 
  #            peeps (content, views, user_id) 
  #             VALUES ($1, $2, $3);"
  #       sql_params = [peep.content, peep.date, post.user_id]
        
  #       DatabaseConnection.exec_params(sql, sql_params)
  # end
  
  # def delete(peep)
  #     sql = "DELETE FROM peeps WHERE id = $1;"
  #     sql_params = [peep]

  #     DatabaseConnection.exec_params(sql, sql_params)
  # end
end