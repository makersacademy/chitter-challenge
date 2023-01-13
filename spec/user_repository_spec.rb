require_relative '../lib/user_repository'
require_relative '../lib/user'

RSpec.describe UserRepository do 

    def reset_users_peeps_table
        seed_sql = File.read('spec/seeds_users_peeps.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
        connection.exec(seed_sql)
    end
      
     
        before(:each) do 
            reset_users_peeps_table
        end

        after(:each) do
            reset_users_peeps_table
        end

    

    it 'lists all users ' do 
        repo = UserRepository.new

        users = repo.all

        expect(users.length).to eq(4)

        expect(users[0].id).to eq('1')
        expect(users[0].name).to eq('David')
        expect(users[0].email).to eq('david@example.com')
        expect(users[0].password).to eq('1234')

        expect(users[1].id).to eq ('2')
        expect(users[1].name).to eq('Anna')
        expect(users[1].email).to eq('anna@email.co.uk')
        expect(users[1].password).to eq('password')
    end
    it 'lists single user ' do 
        repo = UserRepository.new

        user = repo.find('mike@mail.com')

        expect(user.id).to eq('3')
        expect(user.name).to eq('Mike')
    end
    it 'adds a user ' do 
        repo = UserRepository.new

        new_user = User.new

        new_user.name = 'Sandra'
        new_user.email = 'sandra@spain.es'
        new_user.password = 'contrasenia1234'

        repo.add(new_user)
        users = repo.all

        expect(users.last.name).to eq('Sandra')
        expect(users.last.email).to eq('sandra@spain.es')
        expect(users.last.password).to eq('contrasenia1234')
    end
    it 'signs in user ' do 
        repo = UserRepository.new
        user = repo.sign_in('david@example.com', '1234')
        expect(user).to eq('You are now signed in! Enjoy.')
    end
end