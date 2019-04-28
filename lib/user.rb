require 'pg'

class User
  def self.create(name:, username:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
    result = conn.exec("INSERT INTO users(name, username) VALUES('#{name}', '#{username}') RETURNING id, name, username")
      Peep.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'])
  end
end
