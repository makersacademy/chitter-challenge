require_relative './peep'
require_relative './user'

class PeepRepository
  def all # return all peeps
    sql = 'SELECT * FROM peeps;'
    results = DatabaseConnection.exec_params(sql, [])
    peeps = []
    results.each{ |record| peeps << peep_builder(record) }
    return peeps
  end

  def all_with_username
    sql = 'SELECT users.username, peeps.body, peeps.time, peeps.tags, peeps.user_id
    FROM users
    JOIN peeps
    ON peeps.user_id = users.id;'
    results = DatabaseConnection.exec_params(sql, [])
    peeps_with_username = []
    results.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.body = record['body']
      peep.time = record['time']
      peep.tags = record['tags']
      peep.user_id = record['user_id'].to_i
      peep.username = record['username']
      peeps_with_username << peep
    end
    return peeps_with_username
  end

  private

  def peep_builder(record) # used to build peeps in iteration by #all
    peep = Peep.new
    peep.id = record['id'].to_i
    peep.body = record['body']
    peep.time = record['time']
    peep.tags = record['tags']
    peep.user_id = record['user_id'].to_i
    return peep
  end
end

