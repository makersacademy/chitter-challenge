require_relative './peep.rb'

class PeepRepository
  def all
    sql = "SELECT * FROM peeps"
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.map do |peep|
      Peep.new(peep["content"], peep["creation_date"], peep["user_id"])
    end
  end

  def all_with_usernames
    sql = "SELECT content, creation_date, username, name FROM peeps JOIN users ON user_id = users.id"
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.map do |peep|
      Peep.new( peep["content"], peep["creation_date"], peep["user_id"], peep["username"])
    end
  end

  def find(index)
    sql = "SELECT * FROM peeps WHERE id = $1"
    result = DatabaseConnection.exec_params(sql, [index])[0]
    Peep.new(result["content"], result["creation_date"], result["user_id"])
  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, creation_date, user_id) VALUES ($1, NOW(), $2)'
    DatabaseConnection.exec_params(sql, [peep.content, peep.user_id])
  end
end