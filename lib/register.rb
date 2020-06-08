require 'pg'

class Register

  def self.sign_up(name, user_name, email, password)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    con.exec("INSERT INTO users (name, user_name, email, password)
      VALUES ('#{name}', '#{user_name}', '#{email}', '#{password}');")
  end
end
