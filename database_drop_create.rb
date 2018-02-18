require 'pg'

%w[cheeter cheeter_test user_info user_info_test].each do |database|
  connection = PG.connect
  connection.exec("DROP DATABASE #{database}")
  connection.exec("CREATE DATABASE #{database}")
end
