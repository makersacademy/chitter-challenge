require 'pg'

class Chitter_Model

  def self.username
    @username
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 
    result = connection.exec("SELECT * FROM chitts;")
    result.map do |chitts|
      p chitts['username'] + " - " + chitts['chitt'] + " - " + chitts['created_on']
    end     
  end

  def self.create(username:, chitt:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec_params(
      "INSERT INTO chitts (username, chitt, created_on) VALUES($1, $2, $3) RETURNING post_id, username, chitt, created_on;", [
        username, chitt, time]
    )
  end

  def self.logout
    @username = nil
  end

  def self.validation(username:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec_params("SELECT * FROM accounts WHERE username = $1 AND password = $2;", [username, password])   
    if result.to_a.empty?
      return false
    else
      @username = username
      return true
    end
  end

  def self.create_account(name:, username:, password:, email:, created_on:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    if (connection.exec_params("SELECT * FROM accounts WHERE username = $1",[username]).to_a.empty? &&
      connection.exec_params("SELECT * FROM accounts WHERE email = $1", [email]).to_a.empty?) && (name != "" && username != "" && password != "" && email != "")
      puts "I got here!"
      result = connection.exec_params(
        "INSERT INTO accounts (name, username, password, email, created_on) VALUES($1, $2, $3, $4, $5) RETURNING name, username, password, email, created_on;", [
          name, username, password, email, created_on]
      )
      return true
    else
      return false
    end
  end
end
