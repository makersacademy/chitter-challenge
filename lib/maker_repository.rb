require_relative 'maker'

class MakerRepository
  def all
    sql = 'SELECT * FROM makers'
    results_set = DatabaseConnection.exec_params(sql, [])

    makers = []

    results_set.each do |record|
      new_maker = Maker.new
      new_maker.id = record['id']
      new_maker.name = record['name']
      new_maker.username = record['username']
      new_maker.email = record['email']
      new_maker.password = record['password']

     makers << new_maker
    end

    return makers
  end

  def create(maker)
    sql = 'INSERT INTO makers (name, username, email, password) VALUES ($1, $2, $3, $4);'
    params = [maker.name, maker.username, maker.email, maker.password]

    DatabaseConnection.exec_params(sql, params)

    return nil
  end

  def maker_exists?(maker)
    result = all.each do |existing_maker|
      return true if maker.username == existing_maker.username || maker.email == existing_maker.email
    end

    return result
  end

end
