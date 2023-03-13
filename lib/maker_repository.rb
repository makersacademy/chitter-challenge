require_relative './maker'

class MakerRepository
  def all
    sql = 'SELECT id, name, username, email_address, password FROM makers;'
    result_set = DatabaseConnection.exec_params(sql, [])
    makers = []

    result_set.each { |maker|
      new_maker = Maker.new
      new_maker.id = maker['id'].to_i
      new_maker.name = maker['name']
      new_maker.username = maker['username']
      new_maker.email_address = maker['email_address']
      new_maker.password = maker['password']

      makers << new_maker
    } 
    return makers
  end

  def create(maker)
  sql = 'INSERT INTO makers (name, username, email_address, password) VALUES ($1, $2, $3, $4);'
  sql_params = [maker.name, maker.username, maker.email_address, maker.password]
  result_set = DatabaseConnection.exec_params(sql, sql_params)

  return maker
  end

  # def update(student)
  # end

  # def delete(student)
  # end
end