require_relative 'peep'
require_relative 'database_connection'


class PeepRepository

  def all
    # Executes the SQL query:
    # SELECT id, content, time, user_id FROM peeps;

    sql = 'SELECT id, content, time, user_id FROM peeps;'
    sql_params = []

    result_set = DatabaseConnection.exec_params(sql, sql_params)
    
    # Returns an array of Peep objects.
    return get_peeps(result_set)

  end

  def create(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (content, time, user_id) VALUES ($1, $2, $3);

    sql = 'INSERT INTO peeps (content, time, user_id) VALUES ($1, $2, $3);'
    sql_params = [peep.content, peep.time, peep.user_id]

    DatabaseConnection.exec_params(sql, sql_params)

    # returns nil
    return nil
  end

  def find_by_owner(user_id)
    # Executes the SQL query:
    # SELECT id, content, time, user_id FROM peeps WHERE user_id = $1;

    sql = 'SELECT id, content, time, user_id FROM peeps WHERE user_id = $1;'
    sql_params = [user_id]
    
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    # Returns an array of Peep objects.
    return get_peeps(result_set)
  end

  def find_by_tagged_user(user_id)
    # Executes the SQL query:
    # SELECT peeps.id, peeps.content, peeps.time, peeps.user_id FROM peeps JOIN peeps_users ON peeps.id = peeps_users.peep_id JOIN users ON users.id = peeps_users.user_id WHERE users.id = $1;

    sql = 'SELECT peeps.id, peeps.content, peeps.time, peeps.user_id FROM peeps JOIN peeps_users ON peeps.id = peeps_users.peep_id JOIN users ON users.id = peeps_users.user_id WHERE users.id = $1;'
    sql_params = [user_id]
    
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    # Returns an array of Peep objects.
    return get_peeps(result_set)
  end

  private

  def get_peeps(result_set)
    peeps = []

    result_set.each { |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.time = record['time']
      peep.user_id = record['user_id'].to_i

      peeps << peep
    }

    return peeps
  end

end