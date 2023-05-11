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

  context 'retreiving all data from Database' do
    it 'Should return an array of all makers from database when all method is called' do
      repo = MakerRepository.new
      expect(repo.all.length).to eq (2)
      expect(repo.all.first.id).to eq (1)
      expect(repo.all.last.id).to eq (2)
      expect(repo.all[1].name).to eq ('Hayley Lady')
      expect(repo.all[1].password).to eq ('DifferentPassword123.')
    end
  end

  context 'Retreiving a single object from the database' do
    it 'Should return the chosen maker that corresponds with passed id' do
      repo = MakerRepository.new
      selected = repo.find(1)
      expect(selected.name).to eq ('Matty Boi')
      expect(selected.username).to eq ('MattyMooMilk')
    end

    it 'Should return the chosen maker that corresponds with passed username' do
      repo = MakerRepository.new
      maker = repo.find_by_username('MattyMooMilk')
      expect(maker.id).to eq (1)
      expect(maker.email_address).to eq ('mattys_fake_email@tiscali.net')
      expect(maker.password).to eq ('Password1!')
    end
  end

  context 'Creating new makers' do
    it 'Should add a new maker to the makers database when the create method is passed an acceptable obj' do
      repo = MakerRepository.new
      maker = double :maker, name: 'name', username: 'username', email_address: 'fake_email@gmail.com', password: 'Password123'
      repo.create(maker)
      expect(repo.all.last.name).to eq ('name')
      expect(repo.all.last.username).to eq ('username')
      expect(repo.all.last.email_address).to eq ('fake_email@gmail.com')
      expect(repo.all.last.password).to eq ('Password123')
      expect(repo.all.length).to eq (3)
      expect(repo.all.last.id).to eq (3)
    end
  end

  context 'Updating a makers name' do
    it 'Should update the name of the user' do
      repo = MakerRepository.new
      maker = repo.find(1)
      maker.name = "Updated name"
      repo.update(maker)
      updated = repo.find(1)
      expect(updated.name).to eq ('Updated name')
    end
  end
end
