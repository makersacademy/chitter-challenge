require 'user_repository'
require 'user'

def reset_students_table
    seed_sql = File.read('spec/test_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
    connection.exec(seed_sql)
  end
  
  describe StudentRepository do
    before(:each) do 
      reset_users_table
    end
  