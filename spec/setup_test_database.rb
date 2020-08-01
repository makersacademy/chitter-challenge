require 'pg'
require_relative '../lib/database_connection'

def setup_test_database
  puts 'Initalizing...'
  puts 'Database being reset....'
  puts '# 20%'
  sleep 0.01
  puts '## 40%'
  sleep 0.01
  puts '### 60%'
  sleep 0.01
  puts '#### 80%'
  sleep 0.01
  puts '##### 100%'
  puts 'Reset is complete!'
  connection = PG.connect(dbname: ‘chitter_test’)
  connection.exec(“TRUNCATE peeps RESTART IDENTITY;“)
end
