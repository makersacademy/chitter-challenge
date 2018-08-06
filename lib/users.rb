require 'pg'

class User
  def self.create(user, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO user_info (username, password) VALUES('#{user}', '#{password}')")
  end
end
