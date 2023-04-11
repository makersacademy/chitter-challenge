require_relative './peep'
require_relative './user'
require 'time'

class PeepRepository
  def all # return all peeps
    sql = 'SELECT * FROM peeps;'
    results = DatabaseConnection.exec_params(sql, [])
    peeps = []
    results.each{ |record| peeps << peep_builder(record) }
    return peeps
  end

  def all_with_names
    sql = 'SELECT users.name, users.username, peeps.body, peeps.time, peeps.tags, peeps.user_id
    FROM users
    JOIN peeps
    ON peeps.user_id = users.id;'
    results = DatabaseConnection.exec_params(sql, [])
    peeps_with_names = []
    p results
    results.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.body = record['body']
      peep.time = (record['time'])
      peep.tags = record['tags']
      peep.user_id = record['user_id'].to_i
      peep.name = record['name']
      peep.username = record['username']
      peeps_with_names << peep
    end
    return peeps_with_names
  end
  
  def create(peep)
    sql = 'INSERT INTO peeps (body, time, tags, user_id) VALUES ($1, $2, $3, $4);'
    params = [peep.body, peep.time, peep.tags, peep.user_id]
    DatabaseConnection.exec_params(sql, params)
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

