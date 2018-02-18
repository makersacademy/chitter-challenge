require './lib/database_connection.rb'

task :setup do
  p 'Setting up databases...'
  conn = PG.connect
  ['chitter','chitter_test'].each do |database|
      conn.exec("CREATE DATABASE #{database}")
      DatabaseConnection.setup("#{database}")
      DatabaseConnection.query(
        "CREATE TABLE peeps (id SERIAL PRIMARY KEY, string VARCHAR(140), dateCreated TIMESTAMP);
        CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));"
        )
    end
  p 'Set up complete. "chitter" and "chitter_test" databases created'
end

task :test_setup do
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query("TRUNCATE peeps;
  TRUNCATE users;
  INSERT INTO peeps (string, dateCreated) VALUES ('Today was a good day', '#{Time.now}');
  INSERT INTO peeps (string, dateCreated) VALUES ('Very important statement', '#{Time.now}');")
end

task :teardown do
  p "Destroying databases. Type out 'Confirm' to confirm that you want to destroy the Chitter databases."
  confirm = STDIN.gets.chomp
  return unless confirm == 'Confirm'
  conn = PG.connect
  ['chitter','chitter_test'].each do |database|
    conn.exec("DROP DATABASE #{ database }")
  end
end
