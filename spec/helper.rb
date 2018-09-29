require 'pg'

def initialise_test_database
  db_connection = connect
  create_test_database(db_connection)
  empty_test_database(db_connection)
  populate_test_database(db_connection)
end

def create_test_database(connection)
  connection.exec(
    'create table if not exists users (
      id serial primary key,
      name varchar(255),
      username varchar(255),
      email varchar(255),
      password varchar(255)
    );'
  )
  connection.exec(
    'create table if not exists peeps (
      id serial primary key,
      user_id integer references users(id),
      peep_time timestamp,
      peep varchar(280)
    );'
  )
end

def empty_test_database(connection)
  connection.exec('TRUNCATE peeps, users restart identity;')
end

def populate_test_database(connection)
  users = [
    ['Test User 1', 'test_user_1', 'test@user.one', 'password_1'],
    ['Test User 2', 'test_user_2', 'test@user.two', 'password_2'],
    ['Test User 3', 'test_user_3', 'test@user.three', 'password_3']
  ]
  users.each do |user|
    connection.exec("
      INSERT INTO users(name, username, email, password)
      VALUES('#{user[0]}', '#{user[1]}', '#{user[2]}', '#{user[3]}')
    ")
  end
  peeps = [
    [1, DateTime.parse('2018-09-29 12:45:08'), 'User 1 Peep 1'],
    [1, DateTime.parse('2018-09-29 15:42:19'), 'User 1 Peep 2'],
    [1, DateTime.parse('2018-09-29 19:12:01'), 'User 1 Peep 3'],
    [2, DateTime.parse('2018-09-29 11:56:44'), 'User 2 Peep 1'],
    [2, DateTime.parse('2018-09-29 16:19:07'), 'User 2 Peep 2'],
    [3, DateTime.parse('2018-09-29 17:04:26'), 'User 3 Peep 1']
  ]
  peeps.each do |peep|
    connection.exec("
      INSERT INTO peeps(user_id, peep_time, peep)
      VALUES('#{peep[0]}', '#{peep[1]}', '#{peep[2]}')
    ")
  end
end

def connect
  PG.connect(dbname: 'chitter_test')
end
