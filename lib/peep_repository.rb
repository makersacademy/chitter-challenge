class PeepRepository
  def all
    all_peeps = []
    sql = 'SELECT id, content, time_posted, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.time_posted = record['time_posted']
      peep.user_id = record['user_id']
      all_peeps << peep
    end
    all_peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, time_posted, user_id) VALUES ($1, $2, $3);'
    params = [peep.content,peep.time_posted,peep.user_id]
    DatabaseConnection.exec_params(sql, params)
  end

  def find(id)
    sql = 'SELECT id, content, time_posted, user_id FROM peeps WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)
    record = result_set[0]
    peep = Peep.new
    peep.id = record['id']
    peep.content = record['content']
    peep.time_posted = record['time_posted']
    peep.user_id = record['user_id']
    peep
  end

  def find_by_user_id(user_id)
    sql = 'SELECT id, content, time_posted, user_id FROM peeps WHERE user_id = $1;'
    params = [user_id]
    result_set = DatabaseConnection.exec_params(sql, params)
    users_peeps = []
    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.time_posted = record['time_posted']
      peep.user_id = record['user_id']
      users_peeps << peep
    end
    users_peeps
  end
end
