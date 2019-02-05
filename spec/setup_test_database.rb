# frozen_string_literal: true

require 'bcrypt'
require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE peeps, users RESTART IDENTITY CASCADE;')
end

def make_a_user
  hashed_password = BCrypt::Password.create('1234')
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("
    INSERT INTO users (username, name, email, password)
    VALUES('@a', 'B', 'c@d.com', $1);
  ", [hashed_password])
end

def do_some_peeps
  make_a_user

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("
    INSERT INTO peeps (user_id, created, content)
    VALUES(1, '#{Time.now - 130}', 'A!');
  ")
  connection.exec("
    INSERT INTO peeps (user_id, created, content)
    VALUES(1, '#{Time.now - 70}', 'B!');
  ")
end

def peeps_for_time
  make_a_user

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (user_id, created, content)
    VALUES(1, '#{Time.now - 70}', 'A!');")
  connection.exec("INSERT INTO peeps (user_id, created, content)
    VALUES(1, '#{Time.now - 3_610}', 'B!');")
  connection.exec("INSERT INTO peeps (user_id, created, content)
    VALUES(1, '#{Time.now - 86_410}', 'C!');")
  connection.exec("INSERT INTO peeps (user_id, created, content)
    VALUES(1, '#{Time.now - 172_810}', 'D!');")
end
