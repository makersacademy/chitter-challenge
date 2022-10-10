require 'user_repository'
require 'user'

require 'database_connection'
 
RSpec.describe UserRepository do

    def reset_peeps_tables
        seed_sql = File.read('spec/seeds_peepingusers.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
        connection.exec(seed_sql)
    end


    before(:each) do 
        reset_peeps_tables
    end
  
    it 'returns all users' do
        repo = UserRepository.new

        # users = repo.all

        expect(users.length).to eq 2

        expect(repo.all.first.username).to eq "matthewknows" 
        expect(repo.all.first.name).to eq "Matthew Matthew"
        expect(repo.all.first.email).to eq "matthew@matthews.com" 
    end


    # it 'returns a single user' do
    #     repo = UserRepository.new

    #     user = repo.find(1)

    #     expect(user.id).to eq "1"
    #     expect(user.username).to eq "Matthew"
    # end

    xit 'add a new user' do
        repo = UserRepository.new
        new_user = User.new
        # new_ user.email_address = "mary@magdalane.com"
        new_user.name = 'Mary'
        new_user.username = 'maryknows'
        new_user.password = 'mary1234'
        new_user.email = 'mary@marys.com'

        repo.create(new_user)

        # all_users = repo.all 

        expect(repo.all.length). to eq 3
        expect(repo.all[-1].username). to eq 'Mary'
        expect(repo.all[-1].name). to eq 'maryknows'
        expect(repo.all[-1].email). to eq 'mary@marys.com'

    end
    xit 'finds user via email' do
        repo = UserRepository.new
        result = repo.find('mark@marks.com')
        expect(result.name). to eq 'Mark Mark'
        expect(result.email). to eq 'mark@marks.com'
        expect(result.username). to eq 'markknows'
    end


    xit 'checks creditentials of users' do
        repo = UserRepository.new
        expect(repo.sign_in('mark@marks.com', 'mark1234')). to be_truthy
        expect(repo.sign_in('mark@marks.com', '1234')). to be_falsey
    end

    #issue with delete user test
    # xit 'deletes a user' do
    #     repo = UserRepository.new
    #     user_delete = 1
    #     repo.delete(user_delete)

    #     all_users = repo.all
    
    #     expect(all_users.length).to eq 1
    #     expect(all_users.first.id).to eq "1"
    # end
end