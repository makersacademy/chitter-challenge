require 'pg'
require 'digest/md5'

class DBhelper

  def self.new_peep(peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    connection.exec("INSERT INTO peeps (title, body, username, time) VALUES ('#{peep.title}','#{peep.body}', '#{peep.username}', '#{peep.time}')")
  end

  def self.select
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("SELECT * FROM peeps")
  end

  def self.check_user(username)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("SELECT * FROM users WHERE username = ('#{username}')")
  end

  def self.create_account(username,password,email)
    password_hash = Digest::MD5.new << password
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO users (username, email, password) VALUES ('#{username}','#{email}','#{password_hash}')")

  end
end