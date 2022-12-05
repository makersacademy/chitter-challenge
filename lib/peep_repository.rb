require_relative './peep'
# id, content, time

class PeepRepository

  def all
    sql = 'SELECT id, content, time FROM peeps ORDER BY time DESC;'
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = []
    result_set.each do |record|
      peeps << record_to_object(record)
    end
    return peeps
  end


  def create(item)
    # Executes the SQL query:
    sql = 'INSERT INTO peeps (id, content, time) VALUES ($1, $2, $3);'
    # here the new_item_id comes from a separate private method named new_item_id
    # feed the new_id in the sql_params
    sql_params = [ new_id, item.content, item.time]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    return puts "\nYour item has been successfully created.\n"
  end

# ================================================================
  private

  def record_to_object(record)
    object = Peep.new
    object.id = record['id'].to_i
    object.content = record['content']
    object.time = record['time']
    return object
  end


  def new_id
    # query for the last id in the table
    last_id_query = 'SELECT MAX(id) FROM peeps;'
    last_id_result = DatabaseConnection.exec_params(last_id_query, [])

    new_id = nil
    # get the value of the last id
    last_id_result.each do |n|
      new_id =  n['max']
    end
    # new_id is being returned as a string so I convert it to an int
    # add one to the last id to create the new id
    new_id = Integer(new_id) + 1
    return new_id
  end

end
