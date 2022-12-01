require 'user'
require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  context "All users" do
    it "returns a list of all the users on chitter" do
        repo = UserRepository.new
        users = repo.all

        expect(users.length).to eq 3

        expect(users[0].id).to eq 1
        expect(users[0].username).to eq 'Yannis'
        expect(users[0].email).to eq 'yphillip@foals.com'

        expect(users[1].id).to eq 2
        expect(users[1].username).to eq 'Jimmy'
        expect(users[1].email).to eq 'jsmith@foals.com'
    end
  end
end