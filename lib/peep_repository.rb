require_relative './peep'

class PeepRepository
  def all
    sql = 'SELECT * FROM peeps;'
    records = DatabaseConnection.exec_params(sql, [])
    records.map { |record| create_peep_from_record(record) }
  end

  def find(id)
  end

  def create(peep)
  end

  private

  def create_peep_from_record(record)
    peep = Peep.new
    peep.id = record['id'].to_i
    peep.content = record['content']
    peep.time_posted = Time.new(record['time_posted'])
    peep.user_id = record['user_id'].to_i
    return peep
  end
end
