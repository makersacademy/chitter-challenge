require 'user_repository'
require 'user'
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
RSpec.describe UserRepository do
    context "test to see if users are returned" do
        it "returns user_name" do
            repo = UserRepository.new 
            user = repo.all
            @users = []
            user.each do |title|
                @users.push(title.user_name)
            end
            expect(@users).to eq ["bob", "Anna", "Davinder", "Annad"]
        end
        

    end
end
