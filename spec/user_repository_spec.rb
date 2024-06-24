require 'user_repository'

def reset_chitter_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_chitter_tables
  end

  let(:repo) { UserRepository.new }

  describe '#create' do
    it "creates a new user" do
      new_user = double(:user,
        id: 3,
        name: 'Elon Musk', 
        email: 'el_musk@email.com', 
        username: 'im_the_other_elon', 
        password: 'Fakepas5word')
  
      repo.create(new_user)
      expect(new_user.id).to eq(3)
      expect(new_user.name).to eq('Elon Musk')
    end
  end
  
end
