require 'pg'

task :setup do
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect(dbname: 'postgres')
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    Dir.foreach("./db/migrations/") do |fname|
      connection.exec("#{File.open("./db/migrations/#{fname}"){ |file| file.read }}") if fname.end_with?('.sql')
    end
  end
end

task :setup_test_data do

  truncate_database = "TRUNCATE Users, Peeps;"

  create_users =      "INSERT INTO Users(id, email, password)"\
                      "VALUES"\
                      "('1', 'harry@enfield.com', '$2a$10$0FlvRMmSiehnX9IB0cAoB.yliEWZaf1k3RkPRvvqHc/J4OH2ikwYK'),"\
                      "('2', 'jim@carey.com', '$2a$10$0FlvRMmSiehnX9IB0cAoB.yliEWZaf1k3RkPRvvqHc/J4OH2ikwYK'),"\
                      "('3', 'john@cleese.com', '$2a$10$0FlvRMmSiehnX9IB0cAoB.yliEWZaf1k3RkPRvvqHc/J4OH2ikwYK');"

  create_peeps =      "INSERT INTO Peeps(id, body, user_id, created_at)"\
                      "VALUES"\
                      "('1', 'First test peep', '1', '2018-10-26 10:17:15.100413+00'),"\
                      "('2', 'Second test peep', '1', '2018-10-27 11:17:15.100413+00'),"\
                      "('3', 'Third test peep', '1', '2018-10-28 12:31:28.452297+00');"


  q = truncate_database
  q += create_users
  q += create_peeps

  connection = PG.connect(dbname: 'chitter_test').exec(q)
end
