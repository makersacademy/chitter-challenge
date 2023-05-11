require_relative 'peep'
require_relative 'database_connection'

class PeepRepo
  def initialize
    @peeps = []
  end

  def all
    sql = 'SELECT posts.*, user_accounts.username, user_accounts.name 
          FROM posts 
          INNER JOIN user_accounts 
          ON posts.user_account_id = user_accounts.id;'
    result = DatabaseConnection.exec_params(sql, [])
    result.each do |record|
      @peeps << new_peep(record)
    end
    @peeps
  end

  def find(id)
    sql = 'SELECT * FROM posts WHERE id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)
    record = result[0]
    peep = Peep.new
    peep.id = record['id']
    peep.message = record['message']
    peep.time = record['time']
    peep.user_account_id = record['user_account_id']
    peep
  end

  def create(peep)
    sql = 'INSERT INTO posts (message, time, user_account_id) VALUES ($1, $2, $3);'
    params = [peep.message, peep.time, peep.user_account_id]
    DatabaseConnection.exec_params(sql, params)
  end

  private 

  def new_peep(record)
    peep = Peep.new
    peep.id = record['id']
    peep.message = record['message']
    peep.time = record['time']
    peep.user_account_id = record['user_account_id']
    peep.username = record['username']
    peep.name = record['name']
    peep
  end
end
