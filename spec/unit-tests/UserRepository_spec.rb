require "UsersRepository"

def reset_users_posts_table
  seed_sql = File.read('spec/schemas-tables/seeds_users_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end
RSpec.describe UsersRepository do
  before(:each) do 
    reset_users_posts_table
  end

  context "Users repo correctly interactes with database" do 
    it "shows all items in database correctly" do 
      repo = UsersRepository.new
      users = repo.all

      expect(users.length).to eq  6

      expect(users[0].id).to eq  "1"
      expect(users[0].username).to eq  'micheal23'
      expect(users[0].email).to eq  'micheal_james@gmail.com'
      expect(users[0].password).to eq '123456'

      expect(users[1].id).to eq  "2"
      expect(users[1].username).to eq 'fred23'
      expect(users[1].email).to eq  'fred-manu@gmail.com'
      expect(users[1].password).to eq 'ilovemymom456'
    end
    
    it "Gets a single user" do
      repo = UsersRepository.new
      user = repo.find(1)

      expect(user.id).to eq  "1"
      expect(user.username).to eq  'micheal23'
      expect(user.email).to eq  'micheal_james@gmail.com'
      expect(user.password).to eq '123456'
    end
     it 'create a single user' do
      repo = UsersRepository.new
      user = User.new

      user.username =   'new_username'
      user.email = "new_email@gmail.com"
      user.password =  "bigolbitties69"

      repo.create(user)
      users = repo.all
      
      expect(users.length).to eq 7
      expect(users[6].id).to eq "7"
      expect(users[6].username).to eq  'new_username'
      expect(users[6].email).to eq  "new_email@gmail.com"
      expect(users[6].password).to include('Ymlnb2xiaXR0aWVzNjk=')
    end 
     it 'update an user' do
      repo = UsersRepository.new
      user = repo.find(3)

      user.username = 'rubies_new'
      repo.update(user)
      users = repo.all


      expect(users[5].id).to eq "3"
      expect(users[5].username).to eq  'rubies_new'
      expect(users[5].email).to eq "james-lewis333@gmail.com"
      expect(users[5].password).to eq "summin-summin!2323"
    end 
     it 'delete an user' do
      repo = UsersRepository.new
      user = repo.find(1)
      repo.delete(user)

      users = repo.all
      expect(users.length).to eq  5
    end
    it 'returns user when searching email' do
      repo = UsersRepository.new
      user = repo.find_by_email('rico_fr@gmail.com')
      expect(user.id).to eq  '4'
      expect(user.email).to eq  'rico_fr@gmail.com'
      expect(user.username).to eq  'rico-franco'
      expect(user.password).to eq  'bGVmdHJpZ2h0Z2RuaWdodCEyMzIz\n'
    end
    it 'returns false when wrong email entered' do
      repo = UsersRepository.new
      user = repo.find_by_email('32141!')
      expect(user).to eq(false)
    end

  it 'it logs in user if password entered is equal to encrypted password in db' do
      repo = UsersRepository.new
      expect(repo.sign_in('rico_fr@gmail.com', 'leftrightgdnight!2323')).to eq(true)
      expect(repo.sign_in('rico_fr@gmail.com', 'WRONG!2323')).to eq(false)
    end
  end
end 
