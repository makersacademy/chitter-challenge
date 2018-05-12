require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]

end

task :test_database_setup do
  p "Clean my database..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE users, peeps;")
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")

    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE users(
                     id SERIAL PRIMARY KEY,
                     email VARCHAR(60) UNIQUE,
                     name VARCHAR(60),
                     handle VARCHAR(60) UNIQUE,
                     password VARCHAR(240))
                    ;")
    connection.exec("CREATE TABLE peeps(
                    id SERIAL PRIMARY KEY,
                    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
                    peep VARCHAR(240))
                   ;")
  end
end

task :teardown do
  p 'Destroying the monster...'

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{database};")
  end
end

task :cleanall do
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect(dbname: database)
    connection.exec("TRUNCATE users, peeps;")
  end
end

task :populate do
  p "Create some random chitter content..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect(dbname: database)
    result = connection.exec("
    INSERT INTO users(email, name, handle, password)
    VALUES
        ('marcus@emperorofrome.com',
         'Marcus Aurelius',
         'Philosopher King',
          'password123'),
        ('epictetus@slaveofrome.com',
         'Epictetus of Hierapolis',
         'Philosopher Slave',
         'password234')
    RETURNING  id
    ;")
    connection.exec("
    INSERT INTO peeps(user_id, peep)
    VALUES
        ('#{result[0]['id']}', 'You have power over your mind - not outside events. Realize this, and you will find strength'),
        ('#{result[0]['id']}', 'The object of life is not to be on the side of the majority, but to escape finding oneself in the ranks of the insane.'),
        ('#{result[1]['id']}', 'That alone is in our power, which is our own work; and in this class are our opinions, impulses, desires, and aversions.'),
        ('#{result[1]['id']}', 'It is not what happens to you, but how you react to it that matters.')
    ;")
  end
end
