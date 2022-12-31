require_relative './peep'

class PeepRepository
  def all
    sql = 'SELECT id, peep, time, maker_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    peeps = []

    result_set.each do |post|
      peep = Peep.new

      peep.id = post['id']
      peep.peep = post['peep']
      peep.time = post['time']
      peep.maker_id = post['maker_id']

      peeps << peep
    end

    return peeps
  end

  def find(id)
    sql = 'SELECT id, peep, time, maker_id FROM peeps WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    post = Peep.new

    post.id = result_set[0]['id']
    post.peep = result_set[0]['peep']
    post.time = result_set[0]['time']
    post.maker_id = result_set[0]['maker_id']

    return post
  end

  def create(post)
    current_time = DateTime.now
    time_string = current_time.strftime("%Y-%m-%d %H:%M:%S")
    sql = 'INSERT INTO peeps (peep, time, maker_id)
      VALUES ($1, $2, $3);'
    sql_params = [post.peep, time_string, post.maker_id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    return nil
  end
end
