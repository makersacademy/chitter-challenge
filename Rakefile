require 'pg'

task :setup do
  ['chitter'].each do |database|
    connection = PG.connect(dbname: 'postgres')
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    Dir.foreach("./db/migrations/") do |fname|
      connection.exec("#{File.open("./db/migrations/#{fname}"){ |file| file.read }}") if fname.end_with?('.sql')
    end
  end
end

