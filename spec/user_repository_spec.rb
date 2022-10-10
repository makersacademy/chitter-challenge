require 'user'
require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds/user_seeds.sql')
  connection = PG.connect({host: '127.0.0.1', dbname: 'chitter_test'})
  connection.exec(seed_sql)

  describe UserRepository do
    before(:each) do
      reset_users_table
    end

    it "lists all users" do
      repo = UserRepository.new
      users = repo.all 
      expect(users.length).to eq(4)
      expect(users.first.name).to eq("Barry Allen")
    end
  end
end