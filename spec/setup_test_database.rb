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
  conn = DatabaseConnection.setup('chitter_test')
  conn.query("DROP TABLE peeps;")
  conn.query("CREATE TABLE peeps(id SERIAL PRIMARY KEY, content VARCHAR(60), date TIMESTAMP);")
end
