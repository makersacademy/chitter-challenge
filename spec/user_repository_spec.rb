require 'user_repository'
require 'user'

RSpec.describe UserRepository do
  def reset_users_table
      seed_sql = File.read('spec/seeds.sql')
      connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
      connection.exec(seed_sql)
  end

  def reset_posts_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
    connection.exec(seed_sql)
  end
      
    describe UserRepository do
      before(:each) do 
        reset_users_table
      end
      
      it 'finds all users' do
        repo = UserRepository.new
      
        users = repo.all
          
        expect(users.length).to eq(3)
        expect(users.first.name).to eq('John Smith')
      end 

      it 'finds user 1' do
        repo = UserRepository.new

        user = repo.find(1)

        expect(user.name).to eq('John Smith')
        expect(user.username).to eq('JS')
      end

      it 'finds user 1 with peeps' do
        repo = UserRepository.new
        user_with_peeps = repo.find_with_peeps(1)

        peep = double :post, id: 1, peep: 'Hello World', time: '2023-01-08 10:30:00'

        expect(peep.id).to eq(1)
        expect(peep.time).to eq('2023-01-08 10:30:00')
      end

      it 'creates a new user' do
        repo = UserRepository.new
    
        new_user = User.new
        new_user.name = 'Penny Lane'
        new_user.username = 'PLane'
        new_user.email = 'pl@gmail.com'
        new_user.password = 'password4'
        repo.create(new_user)
        
        users = repo.all

        expect(users.length).to eq(4)
        expect(users.last.name).to eq('Penny Lane')
      end

      it 'signs in user' do
        repo = UserRepository.new
        new_user = User.new
        new_user.name = 'Penny Lane'
        new_user.username = 'PLane'
        new_user.email = 'pl@gmail.com'
        new_user.password = 'password4'
        repo.create(new_user)

        expect(repo.sign_in('pl@gmail.com', 'password4')).to eq true
        expect(repo.sign_in('pl@gmail.com', 'passw0rd4')).to eq false
      end

    end

end

