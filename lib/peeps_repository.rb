require 'peeps'

class PeepsRepository

  # Selecting all records
  # No arguments
  def all
    peeps = []
    sql = 'SELECT id, message, time_of_post, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      peep = Peeps.new

      peep.id = record['id']
      peep.message = record['message']
      peep.time_of_post = record['time_of_post']
      peep.user_id = record['user_id']

      peeps << peep
    end
        # Returns an array of Peep objects.
    return peeps
  end

  def find(id)
    # Executes the SQL query:
    sql = 'SELECT id, message, time_of_post, user_id FROM peeps WHERE id = $1;'
    params = [id]

    result = DatabaseConnection.exec_params(sql, params)

    record = result[0]

    peep = Peeps.new
    peep.id = record['id']
    peep.message = record['message']
    peep.time_of_post = record['time_of_post']
    peep.user_id = record['user_id']
    
    return peep

    # Returns a single peep object.
  end

  def create(peep)
    #executes the sql query
    sql = 'INSERT INTO peeps (message, time_of_post, user_id) VALUES ($1, $2, $3)'
    params = [peep.message, peep.time_of_post, peep.user_id]
    DatabaseConnection.exec_params(sql, params)
    #returns nil
    end

  def update(peep)
    #executes a sql query
    sql = 'UPDATE peeps SET message = $1, time_of_post = $2, user_id = $3 WHERE id = $4;'
    params = [peep.message, peep.time_of_post, peep.user_id, peep.id]
    DatabaseConnection.exec_params(sql, params)
  end


  def delete(id)
    #executes a sql query
  sql = 'DELETE FROM peeps WHERE id = $1;'
  params = [id]
  DatabaseConnection.exec_params(sql, params)
  #returns nothing just deletes the record. 
  end
end

