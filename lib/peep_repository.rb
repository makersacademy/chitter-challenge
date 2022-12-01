require_relative 'peep'

class PeepRepository
  def all
    peeps = []

    # Send the SQL query and get the result set.
    sql = 'SELECT id, content, post_time, account_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    # The result set is an array of hashes.
    # Loop through it to create a model
    # object for each record hash.
    result_set.each do |record|

      # Create a new model object
      # with the record data.
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.post_time = record['post_time']
      peep.account_id = record['account_id'].to_i

      peeps << peep
    end

    return peeps
  end

  def find(id)
    sql = 'SELECT id, content, post_time, account_id FROM peeps WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    peep = Peep.new
    peep.id = result_set[0]['id'].to_i
    peep.content = result_set[0]['content']
    peep.post_time = result_set[0]['post_time']
    peep.account_id = result_set[0]['account_id'].to_i

    return peep
  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, post_time, account_id) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [peep.content, peep.post_time, peep.account_id])

    return peep
  end

  def delete(id)
    sql = 'DELETE FROM peeps WHERE id = $1;';
    DatabaseConnection.exec_params(sql, [id]);
  end
end