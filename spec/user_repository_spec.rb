require 'user_repository'
require 'user'

def reset_users_table
    seed_sql = File.read('spec/seeds/seeds_chitter_challenge_test.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
    connection.exec(seed_sql)
end

RSpec.describe UserRepository do

    before(:each) do 
        reset_users_table
    end

    context 'testing the UserRepository class' do
        it 'return all users' do
            repo = UserRepository.new
            user = repo.all

            expect(user.length).to eq 3 
            expect(user[0].id).to eq 1 
            expect(user[0].email).to eq 'chris_@hotmail.com' 
            expect(user[0].password).to eq '1234567890abc'
            expect(user[0].username).to eq 'toppy'
        end

        it 'finds via email' do
            repo = UserRepository.new
        
            user = repo.find('chris_@hotmail.com')
            
            expect(user.id).to eq(1)
        end

        it 'finds via session_id' do
            repo = UserRepository.new
        
            user = repo.find_from_session('toppy')
            
            expect(user.id).to eq(1)
        end

        it 'create a user' do
            repo = UserRepository.new

            new_user = User.new
            new_user.email = 'andy_@gmail.com'
            new_user.password = '1111abcde'
            new_user.username = 'andy'

            repo.create(new_user)

            new_user = repo.all

            expect(new_user.length).to eq 4
            expect(new_user.last.username).to eq 'andy'
        end


        it 'testing sign_in, should return true' do
            repo = UserRepository.new

            new_user = User.new
            new_user.email = 'andy_@gmail.com'
            new_user.password = '1111abcde'
            new_user.username = 'andy'
            
            repo.create(new_user)

            decoded = repo.sign_in(new_user.email, new_user.password)

            expect(decoded).to eq true
        end

        it 'email address does not exsits' do
            repo = UserRepository.new

            decoded = repo.sign_in('fed_@hotmail.com', 'password')

            expect(decoded).to eq nil
        end

        it 'returns false if password !=' do
            repo = UserRepository.new

            new_user = User.new
            new_user.email = 'andy_@gmail.com'
            new_user.password = '1111abcde'
            new_user.username = 'andy'
            
            repo.create(new_user)

            decoded = repo.sign_in('andy_@gmail.com', 'password')

            expect(decoded).to eq false
        end
    end
end