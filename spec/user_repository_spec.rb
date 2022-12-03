require 'user_repository'

RSpec.describe UserRepository do 

  def reset_users_table
    seed_sql = File.read('spec/seeds_chitter_challenge.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
    connection.exec(seed_sql)
  end
  
  describe UserRepository do
    before(:each) do 
      reset_users_table
    end
  
    it 'Get all users' do
      repo = UserRepository.new
      users = repo.all

      expect(users.length).to eq 2

      expect(users.first).to have_attributes(
        id: 1,
        name: 'First Name',
        email: 'firstname@email.com',
        password: '$2a$12$3szom8F8U2FzRLw/9Hbtre/q7lE7T8a3PNy/yoEKVIfpMRW6DRUgm',
        username: 'firstname',
      )
      expect(users.last).to have_attributes(
        id: 2,
        name: 'Second Name',
        email: 'secondname@email.com',
        password: '$2a$12$qPKjx6RUqlBW1DReRvxLCeJobvx7oP2nk6HP7Xdb7ATD74BqeRPKy',
        username: 'secondname',
      )
    end
    
    it 'Get a single user by email' do 
      repo = UserRepository.new

      user = repo.find_by_email("firstname@email.com")

      expect(user).to have_attributes(
        id: 1,
        name: 'First Name',
        email: 'firstname@email.com',
        password: '$2a$12$3szom8F8U2FzRLw/9Hbtre/q7lE7T8a3PNy/yoEKVIfpMRW6DRUgm',
        username: 'firstname',
      )
    end

    it 'Creates a new user' do
      encrypted_password_double = double(:fake_password)
      expect(encrypted_password_double).to receive(:to_s)
        .and_return('$2a$12$/L45fkS0yQgpM.dhS1VvjelZTsAqlXlX2vSSIkO6QGNBZL/nMQuC2')
      
      bcrypt_double = double(:fake_bcrypt)
      expect(bcrypt_double).to receive(:create).with('abcd1234')
        .and_return(encrypted_password_double)
      
      repo = UserRepository.new(bcrypt_double)

      user = User.new
      user.name = 'Third Name'
      user.email = 'thirdname@email.com'
      user.password = 'abcd1234'
      user.username = 'thirdname'

      repo.create(user)

      users = repo.all

      expect(users.last).to have_attributes(
        name: 'Third Name',
        email: 'thirdname@email.com',
        password: '$2a$12$/L45fkS0yQgpM.dhS1VvjelZTsAqlXlX2vSSIkO6QGNBZL/nMQuC2',
        username: 'thirdname',
      )
    end
  end
end
