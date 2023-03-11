require 'user_repository'
def reset_users_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'users' })
    connection.exec(seed_sql)
end
  
describe UserRepository do
    before(:each) do 
      reset_users_table
    end
   # (your tests will go here).
end


