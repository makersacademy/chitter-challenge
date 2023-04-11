require_relative 'database_connection'
require_relative './peep'
require_relative './user_repository'

class PeepRepository
  def all
    peeps = []
    sql = 'SELECT * FROM peeps'
    result = DatabaseConnection.exec_params(sql, [])
    
    result.each do |item|
      peep = Peep.new(item['content'], item['time_of_posting'], item['user_id'])
      peeps << peep
    end

    return peeps
  end

  def ordered
    peeps = []
    sql = 'SELECT * FROM peeps ORDER BY id DESC'
    result = DatabaseConnection.exec_params(sql, [])
    
    result.each do |item|
      peep = Peep.new(item['content'], item['time_of_posting'], item['user_id'])
      peeps << peep
    end

    return peeps
  end

  def create(peep)
    params = [peep.content, peep.time_of_posting, peep.user_id]
    sql = 'INSERT INTO peeps (content, time_of_posting, user_id) VALUES ($1, $2, $3)'
    DatabaseConnection.exec_params(sql, params)
    return true
  end

  def find(user)
    peeps = []
    params = [user]
    sql = 'SELECT * FROM peeps WHERE user_id = $1'
    result = DatabaseConnection.exec_params(sql, params)
    result.each do |item|
      peep = Peep.new(item['content'], item['time_of_posting'], item['user_id'])
      peeps << peep
    end
    return peeps
  end

  def return_single_peep(id)
    params = [id]
    sql = 'SELECT * FROM peeps where id = $1'
    result = DatabaseConnection.exec_params(sql, params)
    peep = Peep.new(result[0]['content'], result[0]['time_of_posting'], result[0]['user_id'])
    return peep
  end

  def return_author(id)
    repo = UserRepository.new
    result = repo.find_by_id(id)
    return result
  end
end
