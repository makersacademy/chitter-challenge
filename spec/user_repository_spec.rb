require 'user'
require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end
  
describe UserRepository do
  before(:each) do
    reset_users_table
  end 
      
  it 'returns a list of all users' do
    repo = UserRepository.new
    users = repo.all
    expect(users.length).to eq(2)
    expect(users[0].id).to eq(1)
    expect(users[0].name).to eq('David')
  end

  it 'finds a single user by the id' do 
    repo = UserRepository.new
    user = repo.find(1)
    expect(user.id).to eq(1)
    expect(user.name).to eq('David')
  end

  describe '.find_by_email' do
    it 'returns the user with the given email address' do 
      repo = UserRepository.new
      user = repo.find_by_email('david@makers.com')
      expect(user.name).to eq('David')
      expect(user.password).to eq('password1')
    end
    it 'returns nil if no user has the given email address' do
      repo = UserRepository.new
      user = repo.find_by_email('ha@makers.com')
      expect(user).to be_nil
    end
  end

  it 'creates a new user' do 
    repo = UserRepository.new

    new_user = User.new
    new_user.name = 'Hana'
    new_user.username = 'hanasmith'
    new_user.email = 'hana@makers.com'
    new_user.password = 'password3'
    repo.create(new_user)

    users = repo.all
    expect(users.length).to eq(3)
    expect(users.last.name).to eq('Hana')
    expect(users.last.email).to eq('hana@makers.com')
  end
 
#   context 'send_tag_email' do
#     include Mail::Matchers

#     before(:each) do
#       Mail::TestMailer.deliveries.clear
#     end

#     it 'send an email' do 
#         username = "test"
#         email = "test@gmail.com"
#         content = "test content"
#         send_tag_email(username, email, content)
  
#         expect(Mail::TestMailer.deliveries.length).to eq(1)
#     end
#   end
end
