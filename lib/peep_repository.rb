require_relative 'peep'
require_relative 'user'

class PeepRepository
  def all
    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = result_set.map do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.peep_time = record['peep_time']
      peep.user_id = record['user_id'].to_i
      peep.reply_to_peep_id = record['reply_to_peep_id'].to_i
      peep
    end
  end

  def all_with_poster
    sql =
    'SELECT
      peeps.id, content, peep_time, user_id, reply_to_peep_id,
      users.name, users.username
    FROM peeps
    JOIN users
    ON users.id = peeps.user_id;'
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = result_set.map do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.peep_time = record['peep_time']
      peep.user_id = record['user_id'].to_i
      peep.reply_to_peep_id = record['reply_to_peep_id'].to_i
      peep.poster = User.new
      peep.poster.id = peep.user_id
      peep.poster.name = record['name']
      peep.poster.username = record['username']
      peep
    end
  end

  def find_with_poster(id)
    sql =
    'SELECT
      peeps.id, content, peep_time, user_id, reply_to_peep_id,
      users.name, users.username
    FROM peeps
    JOIN users
    ON users.id = peeps.user_id
    WHERE peeps.id = $1;'
    sql_params = [id]
    record = DatabaseConnection.exec_params(sql, sql_params).first
    peep = Peep.new
    peep.id = record['id'].to_i
    peep.content = record['content']
    peep.peep_time = record['peep_time']
    peep.user_id = record['user_id'].to_i
    peep.reply_to_peep_id = record['reply_to_peep_id'].to_i
    peep.poster = User.new
    peep.poster.id = peep.user_id
    peep.poster.name = record['name']
    peep.poster.username = record['username']
    peep
  end
end