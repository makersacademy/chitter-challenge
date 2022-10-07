require 'peep.rb'

class PeepRepository

  # Selecting all records
  # No arguments
  def all
    sql = 'SELECT message, tag, time, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    peeps = []
    
    result_set.each do |record|
      peep = Peep.new
      peep.message = record['message']
      peep.tag = record['tag']
      peep.time = record['time']
      peep.user_id = record['user_id']
    peeps << peep
    end
    return peeps
  end

  # finding one record with id as argument
  def find(id)
    # Executes the SQL query:
    # SELECT message, tag, time, user_id FROM peeps WHERE id = $1;

    # Returns a single Peep object.
  end

  # inserting a new record with instance of Peep class as argument
  def create(post)
    # Executes the SQL query:
    # INSERT INTO peeps (message, tag, time, user_id) VALUES ($1, $2, $3, $4)
    # Returns nothing.
  end
end