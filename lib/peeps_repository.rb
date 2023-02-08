require_relative './peep'

class PeepRepository
  def all
    sql = 'SELECT id, message, time AS post_time, date AS post_date, user_id FROM peeps'
    records = DatabaseConnection.exec_params(sql, [])
    peeps = []

    records.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.message = record['message']
      peep.post_time = record['post_time']
      peep.post_date = record['post_date']
      peep.user_id = record['user_id']
      peeps << peep
    end
    return peeps
  end
end