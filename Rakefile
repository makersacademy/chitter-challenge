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

  truncate_database = "TRUNCATE Users;"

  create_users =      "INSERT INTO Users(id, email, password)"\
                      "VALUES"\
                      "('1', 'harry@enfield.com', '$2a$10$0FlvRMmSiehnX9IB0cAoB.yliEWZaf1k3RkPRvvqHc/J4OH2ikwYK'),"\
                      "('2', 'jim@carey.com', '$2a$10$0FlvRMmSiehnX9IB0cAoB.yliEWZaf1k3RkPRvvqHc/J4OH2ikwYK'),"\
                      "('3', 'john@cleese.com', '$2a$10$0FlvRMmSiehnX9IB0cAoB.yliEWZaf1k3RkPRvvqHc/J4OH2ikwYK');"

  q = truncate_database
  q += create_users

  connection = PG.connect(dbname: 'chitter_test').exec(q)
end
