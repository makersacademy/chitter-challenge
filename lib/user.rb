# frozen_string_literal: true

class User
  def self.create(email, password)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                 else
                   PG.connect(dbname: 'chitter')
                 end
    connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{password}')")
  end
end
