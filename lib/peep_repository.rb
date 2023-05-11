require_relative './peep'

class PeepRepository
  def all
    sql = 'SELECT * FROM peeps;'
    records = DatabaseConnection.exec_params(sql, [])
    records.map { |record| create_peep_from_record(record) }
  end

  def find(id)
    sql = 'SELECT * FROM peeps WHERE id = $1;'
    records = DatabaseConnection.exec_params(sql, [id])
    return create_peep_from_record(records.first)
  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, time_posted, user_id)
             VALUES ($1, $2, $3)'
    params = [peep.content, peep.time_posted, peep.user_id]
    DatabaseConnection.exec_params(sql, params)
  end

  private

  def create_peep_from_record(record)
    peep = Peep.new
    peep.id = record['id'].to_i
    peep.content = record['content']
    peep.time_posted = timestamp_to_time_object(record['time_posted'])
    peep.user_id = record['user_id'].to_i
    return peep
  end

  def timestamp_to_time_object(timestamp)
    date, time = timestamp.split
    year, month, day = date.split("-")
    hour, minute, second = time.split(":")
    return Time.new(year, month, day, hour, minute, second)
  end
end
