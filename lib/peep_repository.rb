require_relative './peep'
require_relative './database_connection'

class PeepRepository
  def peep_from_record(record)
    peep = Peep.new
    peep.id = record['id'].to_i
    peep.content = record['content']
    peep.creation_time = record['creation_time']
    peep.link_to = record['link_to'].to_i
    peep.user_id = record['user_id'].to_i
    peep
  end

  def all
    sql_query = 'SELECT * FROM peeps;'
    sql_params = []
    result_set = DatabaseConnection.exec_params(sql_query, sql_params)

    result_set.map { |record| peep_from_record(record) }
  end

  def all_reverse_chron
    sql_query = 'SELECT * FROM peeps ORDER BY creation_time DESC;'
    sql_params = []
    result_set = DatabaseConnection.exec_params(sql_query, sql_params)

    result_set.map { |record| peep_from_record(record) }
  end

  def find_by_id(id)
    sql_query = 'SELECT * FROM peeps WHERE id = $1;'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql_query, sql_params)

    find_result = result_set.map { |record| peep_from_record(record) }

    return nil if find_result.empty?

    find_result[0]
  end

  def find_by_user(user_id)
    sql_query = 'SELECT * FROM peeps WHERE user_id = $1;'
    sql_params = [user_id]
    result_set = DatabaseConnection.exec_params(sql_query, sql_params)

    find_result = result_set.map { |record| peep_from_record(record) }

    return nil if find_result.empty?

    find_result
  end

  def create(peep)
    sql_query = "INSERT INTO peeps \
                  (content, creation_time, link_to, user_id) \
                  VALUES \
                  ($1, $2, $3, $4)"
    sql_params = [peep.content, peep.creation_time, peep.link_to, peep.user_id]

    DatabaseConnection.exec_params(sql_query, sql_params)
  end

  def find_thread(id)
    first_peep = find_by_id(id)
    sql_query = 'SELECT * FROM peeps WHERE link_to = $1 ORDER BY creation_time;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql_query, sql_params)

    thread = result_set.map { |record| peep_from_record(record) }
    thread.insert(0, first_peep)

    return nil if thread.empty?

    thread
  end
end
