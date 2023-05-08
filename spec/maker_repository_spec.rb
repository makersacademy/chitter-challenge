require 'maker_repository'

describe MakerRepository do

  def reset_makers_table
    seed_sql = File.read('spec/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_base_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do
    reset_makers_table
  end

  context 'Creating new makers' do
    it 'Should add a new maker to the makers database when the create method is passed an acceptable obj' do
      repo = MakerRepository.new
      maker_1 = double :maker, name: 'name', username: 'username', email_address: 'fake_email@gmail.com', password: 'Password123'
      repo.create(maker_1)
      expect(repo.all.last.name).to eq ('name')
      expect(repo.all.last.username).to eq ('username')
      expect(repo.all.last.email_address).to eq ('fake_email@gmail.com')
      expect(repo.all.last.password).to eq ('Password123')
      expect(repo.all.length).to eq (3)
      expect(repo.all.last.id).to eq (3)
    end
  end
end
