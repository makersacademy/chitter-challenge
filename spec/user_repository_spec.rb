require 'user'
require 'user_repository'
require 'database_connection'

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

  context "Find users" do
    it "finds the user with index 1" do
        repo = UserRepository.new
        user = repo.find(1)

        expect(user.id).to eq 1
        expect(user.username).to eq 'Yannis'
        expect(user.email).to eq 'yphillip@foals.com'
    end

    xit "finds the user with index 3" do
        user = repo.find(3)

        expect(user.id).to eq 3
        expect(user.username).to eq 'Jack'
        expect(user.email).to eq 'beeker@foals.com'
    end
   end

    context "Create users" do
    xit "creates a new user" do
        repo = UserRepository.new
        user = User.new

        user.username = 'Edwin'
        user.email = 'ed@foals.com'

        repo.create(user)

        users = repo.all
        last_user = users.last
        expect(last_user.username).to eq 'Edwin'
        expect(last_user.email).to eq 'ed@foals.com'
    end
    end


end