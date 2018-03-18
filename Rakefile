require 'pg'

task :setup do

  databases = ['chitter','chitter_test']

  conn = PG.connect(dbname: 'postgres')

  databases.each do |database|
    puts "creating database: #{database}"
    conn.exec("CREATE DATABASE #{database}")
    conn = PG.connect(dbname: database)
    conn.exec("CREATE TABLE accounts (
        id SERIAL PRIMARY KEY,
        username VARCHAR(30),
        password VARCHAR(30),
        email VARCHAR(60)
      )")
    conn.exec("CREATE TABLE peeps (
        id SERIAL PRIMARY KEY,
        text VARCHAR(150),
        time VARCHAR(30),
        author VARCHAR(30)
      )")
  end

end

task :test_setup do

  conn = PG.connect(dbname: 'chitter_test')

  conn.exec('TRUNCATE TABLE peeps')
  conn.exec('ALTER SEQUENCE peeps_id_seq RESTART WITH 1')

  conn.exec("INSERT INTO peeps (text,time,author) VALUES ('I am a peep','first peep','Chris')")
  conn.exec("INSERT INTO peeps (text,time,author) VALUES ('I am also a peep','second peep','Paola')")
  conn.exec("INSERT INTO peeps (text,time,author) VALUES ('One more peep','third peep','Giacomo')")
  conn.exec("INSERT INTO peeps (text,time,author) VALUES ('PEEEEEP!','fourth peep','Paola')")
  conn.exec("INSERT INTO peeps (text,time,author) VALUES ('peep peep','fifth peep','Giacomo')")

  conn.exec('TRUNCATE TABLE accounts')
  conn.exec('ALTER SEQUENCE accounts_id_seq RESTART WITH 1')

  conn.exec("INSERT INTO accounts (username,password,email) VALUES ('Paola','Hola','paola@yahoo.com')")
  conn.exec("INSERT INTO accounts (username,password,email) VALUES ('Giacomo','Bonjourno','giacomo@gmail.com')")
  conn.exec("INSERT INTO accounts (username,password,email) VALUES ('Chris','Hello','chris@hotmail.com')")

end

task :drop do

  puts 'dropping databases'

  conn = PG.connect(dbname: 'postgres')

  conn.exec('DROP DATABASE chitter')
  conn.exec('DROP DATABASE chitter_test')

end
