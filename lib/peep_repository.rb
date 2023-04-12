require_relative 'peep'

class PeepRepository
  def all
    peeps = []

    # Send the SQL query and get the result set.
    sql = 'SELECT id, title, content FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    # The result set is an array of hashes.
    # Loop through it to create a model
    # object for each record hash.
    result_set.each do |record|

      # Create a new model object
      # with the record data.
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.title = record['title']
      peep.content = record['content']

      peeps << peep
    end

    return peeps
  end

  def find(id)
    sql = 'SELECT id, title, content FROM peeps WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    peep = Peep.new
    peep.id = result_set[0]['id'].to_i
    peep.title = result_set[0]['title']
    peep.content = result_set[0]['content']

    return peep
  end

  def create(peep)
    sql = 'INSERT INTO peeps (title, content) VALUES ($1, $2);'
    result_set = DatabaseConnection.exec_params(sql, [peep.title, peep.content])

    return peep
  end

  def delete(id)
    sql = 'DELETE FROM peeps WHERE id = $1;';
    DatabaseConnection.exec_params(sql, [id]);
  end
end