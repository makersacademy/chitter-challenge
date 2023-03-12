require 'maker'

class MakerRepository
  def create(maker)
    sql = 'INSERT INTO makers (email, password, name, username) VALUES ($1, $2, $3, $4);'
    DatabaseConnection.exec_params(sql, [maker.email, maker.password, maker.name, maker.username])

    return maker
  end
end