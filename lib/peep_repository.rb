class PeepRepository

  # Selecting all records
  # No arguments
  def all
    peeps = []
    sql = 'SELECT id, content, timestamp, user_id FROM peeps;'

    results = DatabaseConnection.exec_params(sql, [])

    results.each do |record|
      peep = peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.timestamp = record['timestamp']
      peep.user_id = record['user_id'].to_i
      peeps << peep
    end
    # Returns an array of Peep objects.
    peeps
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    sql = 'SELECT id, content, timestamp, user_id FROM peeps WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])

    peep = Peep.new
    peep.id = result[0]['id'].to_i
    peep.content = result[0]['content']
    peep.timestamp = result[0]['timestamp']
    peep.user_id = result[0]['user_id'].to_i
    # Returns a single Peep object.
    peep
  end

  def find_by_user_id(user_id)
    peeps = []
    # Executes the SQL query:
    sql = 'SELECT id, content, timestamp, user_id FROM peeps WHERE user_id = $1;'
    result = DatabaseConnection.exec_params(sql, [user_id])
    result.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.timestamp = record['timestamp']
      peep.user_id = record['user_id'].to_i
      peeps << peep
    end
    # Returns an array of Peep objects associated to a user.
    peeps
  end

  def post(peep)
    # Executes the SQL query:
    sql = 'INSERT INTO peeps (content, timestamp, user_id) VALUES ($1, $2, $3)'
    DatabaseConnection.exec_params(sql, [peep.content, peep.timestamp, peep.user_id])
    peep
  end

  def delete(peep) # peep is a instance of Peep class
    # Executes the SQL query:
    sql = 'DELETE FROM peeps WHERE id = $1'
    DatabaseConnection.exec_params(sql, [peep.id])
    peep
  end
end