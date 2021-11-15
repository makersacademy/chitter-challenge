class User
  attr_reader :name, :email, :password
  def initialize(name:, email:, password:)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec_params(
        "INSERT INTO users (email, name, password) VALUES('#{email}', '#{name}', '#{password}') RETURNING name, email, password;"
    )
  end

  def find_by(email:, password:)
    result = connection.exec_params(
        "SELECT name FROM users WHERE email includes #{email};"
    )
  end



end
