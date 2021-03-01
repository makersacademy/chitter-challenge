require 'pg'

class User
  def initialize(name, pw, email)
    connection = PG.connect(dbname: 'Chitter')

    connection.exec("INSERT INTO user_list (username, password, email) VALUES ('#{name}', '#{pw}', '#{email}');")
  end

end