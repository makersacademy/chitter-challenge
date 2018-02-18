require 'pg'

task :drop_databases do
  begin
    %w[cheeter cheeter_test].each do |database|
      connection = PG.connect
      connection.exec("DROP DATABASE #{database}")
    end
  rescue => e
  p e
  p 'Databases dropped'
  end
end

task :create_databases do
  %w[cheeter cheeter_test].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database}")
  end
  p 'Databases created'
end
