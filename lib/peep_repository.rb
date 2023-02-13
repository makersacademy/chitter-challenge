require_relative 'peep'
require_relative 'database_connection'
require 'time'

DatabaseConnection.connect 

def reset_peeps_table
  seed_sql = File.read('spec/seeds/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_app_test' })
  connection.exec(seed_sql)
end

class PeepRepository


  def all

    sql = 'SELECT peeps.id, peeps.contents, peeps.time, peeps.user_id, users.username 
    FROM peeps 
     JOIN users
    ON peeps.user_id = users.id;'
    
    # 'SELECT id, contents, time, user_id FROM peeps'
    
    # SELECT peeps.id, peeps.contents, peeps.time, peeps.user_id, users.username 
    # FROM peeps 
    # JOIN users
    # ON peeps.user_id = users.id;
    
    result_set = DatabaseConnection.exec_params(sql, [])

    peeps = []

    result_set.each do |record|
      peep = Peep.new 
      peep.id = record['id']
      peep.contents = record['contents']
      peep.time = Time.parse(record['time'])
      peep.user_id = record['user_id']

      peeps << peep
    end 

    # @sorted_peeps = 
    # sorted_peeps = @peeps.sort_by { |peep| peep.time }
    # return sorted_peeps
    return peeps
    # Returns an array of peep objects.
  end

  def sort_peeps(peeps)
    # @sorted_peeps = @peeps.each do |peep|
    #   peep.time = peep['time'].to_i
    # end 
    # @peeps.all 

    sorted_peeps = peeps.sort_by { |peep| peep.time }
    
    # calls the all method to get the list of peeps 
    # sorts peeps in reverse chronological order (newest to oldest)
    # returns the rev. chrono list of peeps 
    return sorted_peeps.reverse
  end

  def find(id)
    # executes the SQL query: 
    sql = 'SELECT id, contents, time, user_id FROM peeps WHERE id = $1;'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)

    peep = Peep.new
    peep.id = result_set[0]['id']
    peep.contents = result_set[0]['contents']
    peep.time = Time.parse(result_set[0]['time'])
    peep.user_id = result_set[0]['user_id']    
    
    return peep
    #returns a single user 
  end 


  def create(peep)
    # executes the SQL query: 
    sql = 'INSERT INTO peeps (contents, time, user_id) VALUES($1, $2, $3);'
    sql_params = [peep.contents, peep.time, peep.user_id]
    DatabaseConnection.exec_params(sql, sql_params)
    # returns nothing 
  end
end

reset_peeps_table
repo = PeepRepository.new 
peeps = repo.all 
# #peeps = repo.sort_peeps

puts peeps
